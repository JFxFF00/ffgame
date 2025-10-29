import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenuButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const MainMenuButton({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  State<MainMenuButton> createState() => _MainMenuButtonState();
}

class _MainMenuButtonState extends State<MainMenuButton>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  bool isHovered = false;
  Animation<double>? tween;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    tween = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController!,
      curve: Curves.fastEaseInToSlowEaseOut,
    ));
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final style = GoogleFonts.novaMono(
      color: Colors.white,
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        animationController?.forward();
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        animationController!.animateBack(
          0,
          duration: Duration(milliseconds: 300),
        );
        setState(() {
          isHovered = false;
        });
      },
      child: Stack(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 360,
              maxWidth: double.infinity,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: 20,
                top: 8,
                bottom: 8,
                left: 4,
              ),
              child: Text(widget.text, style: style),
            ),
          ),
          AnimatedBuilder(
            animation: animationController!,
            builder: (context, child) {
              final value = tween!.value;
              final size = 340.0;
              final x = -size + value * size;

              return Positioned(
                left: x,
                child: Container(
                  width: size,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withAlpha(120),
                        Colors.transparent,
                      ],
                      begin: Alignment(-1, -0.8),
                      end: Alignment(1, -0.6),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
