import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common/utils/colors.dart';
import '../../../../models/chat/chat.dart';

class ChatItemWidget extends StatelessWidget {
  final Chat chat;

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
            if (chat.photo != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  chat.photo!,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        shape: BoxShape.circle,
                      ),
                      width: 48,
                      height: 48,
                    );
                  },
                ),
              ),
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
                      color: AppColors.white.withOpacity(0.7),
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
