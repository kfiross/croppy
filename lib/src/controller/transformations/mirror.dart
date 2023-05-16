import 'package:croppy/src/src.dart';
import 'package:flutter/widgets.dart';

/// Provides methods for mirroring the image.
mixin MirrorTransformation on BaseCroppableImageController {
  /// Mirrors the image horizontally.
  void onMirrorHorizontal() {
    final newBaseTransformations = data.baseTransformations.copyWith(
      scaleX: data.baseTransformations.scaleX * -1,
    );

    final transformation = getMatrixForBaseTransformations(
      newBaseTransformations,
    );

    final cropRect = data.cropRect.transform(transformation);

    data = data.copyWith(
      cropRect: cropRect,
      baseTransformations: newBaseTransformations,
    );

    notifyListeners();
  }
}
