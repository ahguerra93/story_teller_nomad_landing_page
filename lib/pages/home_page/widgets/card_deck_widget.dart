import 'package:flutter/material.dart';

class CardDeckWidget extends StatefulWidget {
  final List<Widget> pages;
  final int currentIndex;
  final Function(int) onPageChanged;

  const CardDeckWidget({
    super.key,
    required this.pages,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  State<CardDeckWidget> createState() => _CardDeckWidgetState();
}

class _CardDeckWidgetState extends State<CardDeckWidget> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  int _previousIndex = 0;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, -1), // Slide up
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _previousIndex = widget.currentIndex;
  }

  @override
  void didUpdateWidget(CardDeckWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex && !_isAnimating) {
      _animateToPage();
    }
  }

  void _animateToPage() {
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
        // Bottom card (new page - always visible)
        widget.pages[widget.currentIndex],

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
