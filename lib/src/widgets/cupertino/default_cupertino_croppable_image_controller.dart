import 'package:croppy/src/src.dart';
import 'package:flutter/material.dart';

class DefaultCupertinoCroppableImageController extends StatefulWidget {
  const DefaultCupertinoCroppableImageController({
    super.key,
    required this.builder,
    required this.imageProvider,
    required this.initialData,
    this.postProcessFn,
  });

  final ImageProvider imageProvider;
  final CroppableImageData initialData;
  final CroppableImagePostProcessFn? postProcessFn;

  final Widget Function(
    BuildContext context,
    CupertinoCroppableImageController controller,
  ) builder;

  @override
  State<DefaultCupertinoCroppableImageController> createState() =>
      _DefaultCupertinoCroppableImageControllerState();
}

class _DefaultCupertinoCroppableImageControllerState
    extends State<DefaultCupertinoCroppableImageController>
    with TickerProviderStateMixin {
  late final CupertinoCroppableImageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = CupertinoCroppableImageController(
      vsync: this,
      imageProvider: widget.imageProvider,
      data: widget.initialData,
      postProcessFn: widget.postProcessFn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _controller);
  }
}