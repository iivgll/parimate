import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parimate/models/challenge_model.dart';
import '../../../app/app_logger.dart';
import '../../../app/repository_providers.dart';
import '../../../common/utils/colors.dart';
import '../../../models/confirmation.dart';
import 'package:flutter/foundation.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../../app/code_word_notifier.dart';
import 'dart:io';
import 'package:parimate/repositories/confirmation_repository.dart';

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
  bool _shareInChat = true;
  Uint8List? _videoThumbnail;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _videoThumbnail = null;
    super.dispose();
  }

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
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
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
                    'Загрузи подтверждение\nвыполнения челленджа',
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
                  backgroundColor: AppColors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: AppColors.white)
                    : const Text(
                        'Отправить на проверку',
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

    if (widget.challenge.confirmationType == 'GEO') {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.location_on,
              color: AppColors.orange,
              size: 48,
            ),
            const SizedBox(height: 16),
            const Text(
              'Отправить текущую геолокацию',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Нажмите кнопку "Отправить на проверку", чтобы отправить вашу текущую геолокацию',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.blackMin,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.orange),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: AppColors.orange,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Убедитесь, что вы находитесь в нужном месте',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        if (widget.challenge.confirmationType == 'VIDEO')
          ref.watch(codeWordNotifierProvider).when(
                data: (codeWord) => Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColors.blackMin,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.orange),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Важно!',
                        style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Для подтверждения подлинности видео, пожалуйста, '
                        'покажите или произнесите кодовое слово:',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          codeWord.word,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.orange),
                ),
                error: (error, stack) => const SizedBox.shrink(),
              ),
        if (_selectedFile != null &&
            widget.challenge.confirmationType == 'PHOTO')
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: kIsWeb
                      ? Image.network(
                          _selectedFile!.path,
                          fit: BoxFit.cover,
                        )
                      : Image.memory(
                          Uint8List.fromList(
                            File(_selectedFile!.path).readAsBytesSync(),
                          ),
                          fit: BoxFit.cover,
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
          )
        else if (_selectedFile != null &&
            widget.challenge.confirmationType == 'VIDEO')
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: kIsWeb
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              color: AppColors.blackMin,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.video_file,
                                  color: AppColors.white,
                                  size: 48,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  _selectedFile?.name ?? 'Видео выбрано',
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        )
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            if (_videoThumbnail != null)
                              Image.memory(
                                _videoThumbnail!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              )
                            else
                              Container(
                                color: AppColors.blackMin,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            const Icon(
                              Icons.play_circle_outline,
                              color: AppColors.white,
                              size: 48,
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
                      _videoThumbnail = null;
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
          )
        else
          GestureDetector(
            onTap: _pickFile,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.challenge.confirmationType == 'PHOTO'
                        ? Icons.photo_camera
                        : Icons.videocam,
                    color: AppColors.white,
                    size: 48,
                  ),
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
              ),
            ),
          ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.blackMin,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Делиться в чате',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                ),
              ),
              Switch(
                value: _shareInChat,
                onChanged: (value) {
                  setState(() {
                    _shareInChat = value;
                  });
                },
                activeColor: AppColors.orange,
                inactiveTrackColor: AppColors.grey,
              ),
            ],
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
            ? 100 * 1024 * 1024
            : 800 * 1024 * 1024;

        if (fileSize > maxSize) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  widget.challenge.confirmationType == 'PHOTO'
                      ? 'Фото слишком большое (максимум 100 МБ)'
                      : 'Видео слишком большое (максимум 800 МБ)',
                ),
              ),
            );
          }
          return;
        }

        setState(() {
          _selectedFile = file;
        });

        if (widget.challenge.confirmationType == 'VIDEO') {
          await _generateVideoThumbnail(file.path);
        }
      }
    } catch (e, stack) {
      AppLogger.error('Ошибка при выборе файла: $e');
      AppLogger.error('Stack trace: $stack');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка при выборе файла: $e')),
        );
      }
    }
  }

  Future<void> _handleUpload() async {
    if (_isLoading) return;

    if (widget.challenge.confirmationType != 'TEXT' &&
        widget.challenge.confirmationType != 'GEO' &&
        _selectedFile == null) {
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
      } else if (widget.challenge.confirmationType == 'GEO') {
        // Здесь будет логика получения геолокации
        // Для примера используем фиксированные координаты
        value = '55.7558,37.6173'; // Москва, Красная площадь
      } else {
        try {
          value = await ref.read(fileRepositoryProvider).uploadFile(
                _selectedFile!,
                challengeId: widget.challenge.id,
              );
        } catch (e) {
          if (mounted) {
            await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: AppColors.blackMin,
                title: const Text(
                  'Ошибка',
                  style: TextStyle(color: AppColors.white),
                ),
                content: Text(
                  e.toString().replaceAll('Exception: ', ''),
                  style: const TextStyle(color: AppColors.white),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'OK',
                      style: TextStyle(color: AppColors.orange),
                    ),
                  ),
                ],
              ),
            );
          }
          return;
        }
      }

      try {
        final success =
            await ref.read(confirmationRepositoryProvider).postConfirmation(
                  challengeId: widget.challenge.id,
                  data: ConfirmationData(
                    type: widget.challenge.confirmationType,
                    value: value,
                  ),
                  share: _shareInChat,
                );

        if (mounted) {
          if (success) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Подтверждение успешно отправлено')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Не удалось отправить подтверждение')),
            );
          }
        }
      } on ConfirmationException catch (e) {
        if (mounted) {
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: AppColors.blackMin,
              title: const Text(
                'Ошибка отправки',
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.bold),
              ),
              content: Text(
                e.message,
                style: const TextStyle(color: AppColors.white),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                        color: AppColors.orange, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        AppLogger.error('Ошибка при отправке подтверждения: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ошибка при отправке подтверждения: $e')),
          );
        }
      }
    } catch (e) {
      AppLogger.error('Ошибка при загрузке файла или отправке: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка при загрузке файла: $e')),
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

  Future<void> _generateVideoThumbnail(String videoPath) async {
    if (kIsWeb) return; // Пропускаем генерацию превью для веб

    try {
      final uint8list = await VideoThumbnail.thumbnailData(
        video: videoPath,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 512,
        quality: 75,
      );
      if (mounted) {
        setState(() {
          _videoThumbnail = uint8list;
        });
      }
    } catch (e) {
      AppLogger.error('Ошибка при создании превью видео: $e');
    }
  }
}
