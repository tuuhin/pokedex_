import 'package:flutter/material.dart';

import '../../../../domain/models/base_stats_model.dart';

class AnimatedStatsBar extends StatefulWidget {
  final BaseStatsModel statsModel;
  final Color progressbarColor;
  final int limit;
  const AnimatedStatsBar({
    Key? key,
    required this.statsModel,
    required this.progressbarColor,
    required this.limit,
  }) : super(key: key);

  @override
  State<AnimatedStatsBar> createState() => _AnimatedStatsBarState();
}

class _AnimatedStatsBarState extends State<AnimatedStatsBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> stats;
  late Animation<Color?> color;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    stats = Tween<double>(begin: 0.0, end: widget.statsModel.baseStat).animate(
        CurvedAnimation(parent: _controller, curve: Curves.decelerate));
    color = ColorTween(
            begin: widget.progressbarColor.withOpacity(0.1),
            end: widget.progressbarColor)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: SizedBox(
                  width: 80,
                  child: Text(widget.statsModel.name,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600)),
                ),
              ),
              Flexible(
                child: Text(
                  widget.statsModel.baseStat.toInt().toString(),
                ),
              ),
              Flexible(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: stats.value / widget.limit,
                    valueColor: color,
                    backgroundColor: widget.progressbarColor.withOpacity(0.1),
                    semanticsLabel: widget.statsModel.name,
                    minHeight: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
