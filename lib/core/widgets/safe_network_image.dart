import 'package:flutter/material.dart';

class SafeNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  final BorderRadius? borderRadius;

  const SafeNetworkImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _buildPlaceholder();
    }

    // Validate URL before attempting to load
    if (!_isValidUrl(imageUrl!)) {
      return _buildPlaceholder();
    }

    Widget imageWidget = Image.network(
      imageUrl!,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        debugPrint('Image loading error: $error');
        return _buildPlaceholder();
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return _buildLoadingPlaceholder();
      },
    );

    if (borderRadius != null) {
      imageWidget = ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    return imageWidget;
  }

  Widget _buildPlaceholder() {
    if (placeholder != null) {
      return placeholder!;
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: borderRadius,
      ),
      child: const Icon(Icons.image, color: Colors.grey, size: 30),
    );
  }

  Widget _buildLoadingPlaceholder() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: borderRadius,
      ),
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
        ),
      ),
    );
  }

  bool _isValidUrl(String url) {
    try {
      // Basic URL validation
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        return false;
      }

      // Check for common invalid patterns
      if (url.contains('null') ||
          url.contains('undefined') ||
          url.trim().isEmpty ||
          url.contains('wikipedia.org') ||
          url.contains('upload.wikimedia.org')) {
        return false;
      }

      // Additional validation for malformed URLs
      final uri = Uri.tryParse(url);
      if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
