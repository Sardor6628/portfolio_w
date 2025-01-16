import 'package:flutter/material.dart';
class HoverableTextButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const HoverableTextButton({
    required this.label,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  __HoverableTextButtonState createState() => __HoverableTextButtonState();
}

class __HoverableTextButtonState extends State<HoverableTextButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _isHovered
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: _isHovered ? 18 : 16,
            ),
          ),
        ),
      ),
    );
  }
}


class HoverableRow extends StatefulWidget {
  final VoidCallback onTap;

  const HoverableRow({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _HoverableRowState createState() => _HoverableRowState();
}

class _HoverableRowState extends State<HoverableRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 114,
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: _isHovered
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Row(
            children: [
              Container(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.apple, color: Colors.blue, size: _isHovered?34:32)),
              Container(
                  height: 30,
                  width: 30,
                  child: Icon(Icons.arrow_forward_ios_outlined, size: _isHovered?30:28)),
              Icon(Icons.home, size: _isHovered?34:32),
            ],
          ),
        ),
      ),
    );
  }
}