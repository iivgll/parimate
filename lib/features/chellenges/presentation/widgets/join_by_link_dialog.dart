import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:parimate/app/repository_providers.dart';
import '../../../../common/utils/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinByLinkDialog extends ConsumerStatefulWidget {
  const JoinByLinkDialog({super.key});

  @override
  ConsumerState<JoinByLinkDialog> createState() => _JoinByLinkDialogState();
}

class _JoinByLinkDialogState extends ConsumerState<JoinByLinkDialog> {
  final _linkController = TextEditingController();
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.blackMin,
      contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: _linkController,
                      style: const TextStyle(color: AppColors.white),
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: 'Вставьте ссылку',
                        hintStyle: TextStyle(color: AppColors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      if (_linkController.text.isNotEmpty) {
                        try {
                          await ref
                              .read(challengeRepositoryProvider)
                              .getChallengeByLink(
                                userTgId: '44',
                                link: _linkController.text,
                              );
                          if (context.mounted) {
                            Navigator.pop(context, _linkController.text);
                          }
                        } catch (e) {
                          String errorMessage = 'Челлендж не найден';
                          if (e is DioException && e.response?.data != null) {
                            errorMessage =
                                e.response?.data['message'] ?? errorMessage;
                          }
                          setState(() {
                            _errorText = errorMessage;
                          });
                        }
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: AppColors.black,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            if (_errorText != null) ...[
              const SizedBox(height: 8),
              Text(
                _errorText!,
                style: const TextStyle(
                  color: AppColors.orange,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _linkController.dispose();
    super.dispose();
  }
}
