import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SafeNetworkImageUniversal extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  final BorderRadius? borderRadius;
  final Color? svgColor;

  const SafeNetworkImageUniversal({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.borderRadius,
    this.svgColor,
  });

  @override
  Widget build(BuildContext context) {
    // Check if imageUrl is null or empty
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _buildPlaceholder();
    }

    // Check if the URL looks like it might be invalid
    if (!_isValidUrl(imageUrl!)) {
      return _buildPlaceholder();
    }

    // Determine if it's likely an SVG based on URL or content
    if (_isSvgUrl(imageUrl!)) {
      return _buildSvgWidget();
    } else {
      return _buildImageWidget();
    }
  }

  Widget _buildSvgWidget() {
    Widget svgWidget = SvgPicture.network(
      imageUrl!,
      width: width,
      height: height,
      color: svgColor,
      errorBuilder: (context, error, stackTrace) {
        debugPrint('SVG loading error: $error');
        // If SVG fails, try as regular image
        return _buildImageWidget();
      },
      placeholderBuilder: (context) => _buildLoadingPlaceholder(),
    );

    // Apply borderRadius if provided
    if (borderRadius != null) {
      svgWidget = ClipRRect(borderRadius: borderRadius!, child: svgWidget);
    }

    return svgWidget;
  }

  Widget _buildImageWidget() {
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

    // Apply borderRadius if provided
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
          url.trim().isEmpty) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  bool _isSvgUrl(String url) {
    // Check if URL ends with .svg
    if (url.toLowerCase().endsWith('.svg')) {
      return true;
    }

    // Check if URL contains svg in the path
    if (url.toLowerCase().contains('.svg')) {
      return true;
    }

    // For category images, we might want to assume they're SVGs
    // You can customize this logic based on your API
    return false; // Default to treating as regular image
  }
}
