import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parimate/models/challenge_model.dart';
import '../../../app/repository_providers.dart';
import '../../../common/utils/colors.dart';
import '../../../models/confirmation.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class ConfirmationUploadPage extends ConsumerStatefulWidget {
  final ChallengeModel challenge;

  const ConfirmationUploadPage({
    super.key,
    required this.challenge,
  });

  @override
  ConsumerState<ConfirmationUploadPage> createState() =>
      _ConfirmationUploadPageState();
}

class _ConfirmationUploadPageState
    extends ConsumerState<ConfirmationUploadPage> {
  final TextEditingController _textController = TextEditingController();
  XFile? _selectedFile;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.challenge.name,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.blackMin,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Загрузи подтверждения\nвыполнения челленджа',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  _buildUploadSection(context),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handleUpload,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: AppColors.white)
                    : const Text(
                        'Отправить',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadSection(BuildContext context) {
    if (widget.challenge.confirmationType == 'TEXT') {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: _textController,
          style: const TextStyle(color: AppColors.white),
          maxLines: 5,
          decoration: const InputDecoration(
            hintText: 'Введите текст подтверждения...',
            hintStyle: TextStyle(color: AppColors.grey),
            border: InputBorder.none,
          ),
        ),
      );
    }

    return Column(
      children: [
        if (_selectedFile != null) ...[
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: widget.challenge.confirmationType == 'PHOTO'
                      ? kIsWeb
                          ? Image.network(
                              _selectedFile!.path,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(_selectedFile!.path),
                              fit: BoxFit.cover,
                            )
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              color: AppColors.blackMin,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            const Icon(
                              Icons.video_file,
                              color: AppColors.white,
                              size: 48,
                            ),
                            const Text(
                              'Видео выбрано',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedFile = null;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
        GestureDetector(
          onTap: _pickFile,
          child: Container(
            height: _selectedFile != null ? 60 : 200,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.challenge.confirmationType == 'PHOTO'
                      ? Icons.photo_camera
                      : Icons.videocam,
                  color: AppColors.white,
                  size: _selectedFile != null ? 24 : 48,
                ),
                if (_selectedFile == null) ...[
                  const SizedBox(height: 16),
                  Text(
                    widget.challenge.confirmationType == 'PHOTO'
                        ? 'Загрузить фото'
                        : 'Загрузить видео',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickFile() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? file = widget.challenge.confirmationType == 'PHOTO'
          ? await picker.pickImage(
              source: ImageSource.gallery,
              maxWidth: 1920,
              maxHeight: 1080,
              imageQuality: 85,
            )
          : await picker.pickVideo(
              source: ImageSource.gallery,
              maxDuration: const Duration(minutes: 5),
            );

      if (file != null) {
        final fileSize = await file.length();
        final maxSize = widget.challenge.confirmationType == 'PHOTO'
            ? 10 * 1024 * 1024
            : 100 * 1024 * 1024;

        if (fileSize > maxSize) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Файл слишком большой')),
            );
          }
          return;
        }

        setState(() {
          _selectedFile = file;
        });
      }
    } catch (e, stack) {
      print('Ошибка при выборе файла: $e');
      print('Stack trace: $stack');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка при выборе файла: $e')),
        );
      }
    }
  }

  Future<void> _handleUpload() async {
    if (_isLoading) return;

    if (widget.challenge.confirmationType != 'TEXT' && _selectedFile == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пожалуйста, выберите файл')),
      );
      return;
    }

    if (widget.challenge.confirmationType == 'TEXT' &&
        _textController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пожалуйста, введите текст')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      String value;

      if (widget.challenge.confirmationType == 'TEXT') {
        value = _textController.text.trim();
      } else {
        value = await ref.read(fileRepositoryProvider).uploadFile(
              _selectedFile!,
              userTgId: '44', // TODO: Получить реальный ID пользователя
              challengeId: widget.challenge.id,
            );
      }

      final success =
          await ref.read(confirmationRepositoryProvider).postConfirmation(
                userTgId: '44',
                challengeId: widget.challenge.id,
                data: ConfirmationData(
                  type: widget.challenge.confirmationType,
                  value: value,
                ),
                share: true,
              );

      if (mounted) {
        if (success) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Подтверждение успешно отправлено')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ошибка при отправке подтверждения')),
          );
        }
      }
    } catch (e) {
      print('Ошибка при отправке: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка при отправке: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
