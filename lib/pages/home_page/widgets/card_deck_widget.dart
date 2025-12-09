import 'package:flutter/material.dart';

class CardDeckWidget extends StatefulWidget {
  final List<Widget> pages;
  final int currentIndex;
  final Function(int) onPageChanged;
  final Curve slideCurve;
  final Curve scaleCurve;
  final Duration animationDuration;

  const CardDeckWidget({
    super.key,
    required this.pages,
    required this.currentIndex,
    required this.onPageChanged,
    this.slideCurve = Curves.easeInOutCubic,
    this.scaleCurve = Curves.easeOutQuart,
    this.animationDuration = const Duration(milliseconds: 600),
  });

  @override
  State<CardDeckWidget> createState() => _CardDeckWidgetState();
}

class _CardDeckWidgetState extends State<CardDeckWidget> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  int _previousIndex = 0;
  bool _isAnimating = false;
  bool _slideUp = true; // Direction of slide animation

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _updateSlideAnimation();
    _previousIndex = widget.currentIndex;
  }

  void _updateSlideAnimation() {
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: _slideUp ? Offset(0, -1) : Offset(0, 1), // Slide up or down
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.slideCurve,
    ));

    // Scale animation for incoming page (1.15 → 1.0)
    _scaleAnimation = Tween<double>(
      begin: 1.15,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.scaleCurve,
    ));
  }

  @override
  void didUpdateWidget(CardDeckWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex && !_isAnimating) {
      _animateToPage();
    }
  }

  void _animateToPage() {
    // Determine slide direction based on index change
    // Special cases for wraparound animations
    if (_previousIndex == widget.pages.length - 1 && widget.currentIndex == 0) {
      _slideUp = true; // Force upward slide for last→first wraparound
    } else if (_previousIndex == 0 && widget.currentIndex == widget.pages.length - 1) {
      _slideUp = false; // Force downward slide for first→last wraparound
    } else {
      _slideUp = widget.currentIndex > _previousIndex;
    }
    _updateSlideAnimation();

    setState(() {
      _isAnimating = true;
    });

    _animationController.forward().then((_) {
      setState(() {
        _previousIndex = widget.currentIndex;
        _isAnimating = false;
      });
      _animationController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Bottom card (new page) - with scaling animation during transition
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            double scale = _isAnimating ? _scaleAnimation.value : 1.0;
            return Transform.scale(
              scale: scale,
              child: widget.pages[widget.currentIndex],
            );
          },
        ),

        // Top card (old page - slides away during animation)
        if (_isAnimating)
          AnimatedBuilder(
            animation: _slideAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  _slideAnimation.value.dx * MediaQuery.of(context).size.width,
                  _slideAnimation.value.dy * MediaQuery.of(context).size.height,
                ),
                child: widget.pages[_previousIndex],
              );
            },
          ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
