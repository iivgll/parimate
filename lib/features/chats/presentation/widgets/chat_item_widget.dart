import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parimate/common/utils/extensions.dart';
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
    print('asdfdafadf ${chat.photo}');
    return SvgPicture.asset(
      'assets/icons/${chat.photo ?? 'alien'}.svg',
      width: 50,
      height: 50,
      colorFilter: AppColors.white.toColorFilter,
      placeholderBuilder: (context) => const Icon(
        Icons.extension,
        color: AppColors.white,
        size: 50,
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
