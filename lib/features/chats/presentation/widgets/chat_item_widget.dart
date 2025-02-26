import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common/utils/colors.dart';
import '../../../../models/chat/chat.dart';

class ChatItemWidget extends StatelessWidget {
  final Chat chat;
  static const String _defaultImageUrl =
      'https://upload.wikimedia.org/wikipedia/commons/c/c3/NGC_4414_%28NASA-med%29.jpg';

  const ChatItemWidget({super.key, required this.chat});

  Future<void> _launchTelegramChat() async {
    final url = Uri.parse('https://${chat.link}');
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Не удалось открыть ссылку: ${chat.link}');
      }
    } catch (e) {
      debugPrint('Ошибка при открытии ссылки: $e');
    }
  }

  Widget _buildChatImage() {
    if (chat.photo == null) {
      return _buildNetworkImage(_defaultImageUrl);
    }

    return _buildNetworkImage(chat.photo!);
  }

  Widget _buildNetworkImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Shimmer.fromColors(
            baseColor: AppColors.grey.withValues(alpha: 0.3),
            highlightColor: AppColors.grey.withValues(alpha: 0.5),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Image.network(
            imageUrl,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) return child;
              return AnimatedOpacity(
                opacity: frame != null ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: child,
              );
            },
            errorBuilder: (context, error, stackTrace) {
              if (imageUrl != _defaultImageUrl) {
                return _buildNetworkImage(_defaultImageUrl);
              }
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 48,
                height: 48,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchTelegramChat,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.blackMin,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            _buildChatImage(),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.id,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    chat.link,
                    style: TextStyle(
                      color: AppColors.white.withValues(alpha: 0.7),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_circle_right_outlined,
              color: AppColors.white,
              size: 32,
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
