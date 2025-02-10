import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common/utils/colors.dart';
import '../../../../app/metadata_notifier.dart';

class CategoryPickerSheet extends ConsumerWidget {
  final Function(String) onCategorySelected;
  final String selectedCategory;

  const CategoryPickerSheet({
    super.key,
    required this.onCategorySelected,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metadataAsync = ref.watch(metadataProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: AppColors.blackMin,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.black,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Выберите категорию',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: metadataAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text(
                  'Ошибка загрузки категорий: $error',
                  style: const TextStyle(color: AppColors.white),
                ),
              ),
              data: (metadata) => ListView.builder(
                itemCount: metadata.categories.length,
                itemBuilder: (context, index) {
                  final category = metadata.categories[index];
                  final isSelected = category == selectedCategory;

                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        category,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(
                              Icons.check,
                              color: AppColors.orange,
                              size: 20,
                            )
                          : null,
                      onTap: () {
                        onCategorySelected(category);
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
