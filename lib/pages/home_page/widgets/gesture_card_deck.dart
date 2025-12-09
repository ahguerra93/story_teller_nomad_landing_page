import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'card_deck_widget.dart';

class GestureCardDeck extends StatefulWidget {
  final List<Widget> pages;
  final int initialIndex;
  final Function(int)? onPageChanged;
  final double sensitivity; // How much drag needed to trigger page change
  final GlobalKey<_GestureCardDeckState>? controller; // Optional controller for external access

  const GestureCardDeck({
    super.key,
    required this.pages,
    this.initialIndex = 0,
    this.onPageChanged,
    this.sensitivity = 100.0, // pixels
    this.controller,
  });

  @override
  State<GestureCardDeck> createState() => _GestureCardDeckState();
}

class _GestureCardDeckState extends State<GestureCardDeck> {
  late int _currentIndex;
  double _dragStartY = 0;
  bool _isDragging = false;
  DateTime _lastScrollTime = DateTime.now();
  static const int _scrollCooldownMs = 500; // Minimum time between scroll events

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onPanStart(DragStartDetails details) {
    _dragStartY = details.localPosition.dy;
    _isDragging = true;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (!_isDragging) return;

    // Optional: Add visual feedback during drag
    // You could add a subtle scale or opacity change here
  }

  void _onPanEnd(DragEndDetails details) {
    if (!_isDragging) return;

    _isDragging = false;

    // Calculate drag distance and direction
    double dragDistance = details.localPosition.dy - _dragStartY;

    if (dragDistance.abs() >= widget.sensitivity) {
      int newIndex;

      if (dragDistance < 0) {
        // Dragging up - go to next page (higher index)
        newIndex = (_currentIndex + 1).clamp(0, widget.pages.length - 1);
      } else {
        // Dragging down - go to previous page (lower index)
        newIndex = (_currentIndex - 1).clamp(0, widget.pages.length - 1);
      }

      if (newIndex != _currentIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
        widget.onPageChanged?.call(_currentIndex);
      }
    }
  }

  void _onScroll(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      // Check cooldown to prevent rapid scroll events
      DateTime now = DateTime.now();
      if (now.difference(_lastScrollTime).inMilliseconds < _scrollCooldownMs) {
        return; // Ignore scroll event if within cooldown period
      }

      double scrollDelta = event.scrollDelta.dy;

      // More restrictive threshold - only respond to deliberate scrolls
      if (scrollDelta.abs() >= 50) {
        int newIndex;

        if (scrollDelta > 0) {
          // Scrolling down - go to next page
          newIndex = (_currentIndex + 1).clamp(0, widget.pages.length - 1);
        } else {
          // Scrolling up - go to previous page
          newIndex = (_currentIndex - 1).clamp(0, widget.pages.length - 1);
        }

        if (newIndex != _currentIndex) {
          _lastScrollTime = now; // Update last scroll time
          setState(() {
            _currentIndex = newIndex;
          });
          widget.onPageChanged?.call(_currentIndex);
        }
      }
    }
  }

  // Public methods for external control
  void goToPage(int index) {
    if (index >= 0 && index < widget.pages.length && index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
      widget.onPageChanged?.call(_currentIndex);
    }
  }

  int get currentIndex => _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: _onScroll,
      child: GestureDetector(
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: CardDeckWidget(
          pages: widget.pages,
          currentIndex: _currentIndex,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
            widget.onPageChanged?.call(index);
          },
        ),
      ),
    );
  }
}
