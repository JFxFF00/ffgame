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
  late AnimationController animationController;
  bool isHovered = false;
  late Animation<double> tween;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    tween = Tween<double>(begin: 0.2, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final style = GoogleFonts.novaMono(
      color: Colors.white,
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          animationController.forward();
          setState(() {
            isHovered = true;
          });
        },
        onExit: (event) {
          animationController.animateBack(
            0,
            duration: Duration(milliseconds: 300),
          );
          setState(() {
            isHovered = false;
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Stack(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 360,
                  maxWidth: double.infinity,
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    right: 20,
                    top: 8,
                    bottom: 8,
                    left: 12,
                  ),
                  child: Text(widget.text, style: style),
                ),
              ),
              AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  final value = tween.value;
                  final size = 340.0;
                  final x = -size + value * size;

                  return Positioned(
                    left: x,
                    child: Container(
                      width: size,
                      height: 400,
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
        ),
      ),
    );
  }
}
