import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/utils/colors.dart';

class IconPickerSheet extends StatelessWidget {
  final Function(String) onIconSelected;
  final String selectedIcon;

  const IconPickerSheet({
    super.key,
    required this.onIconSelected,
    required this.selectedIcon,
  });

  // Список доступных иконок
  static const List<String> availableIcons = [
    'activity',
    'alarm',
    'alien',
    'apple',
    'ball-american-football',
    'ball-baseball',
    'ball-basketball',
    'ball-football',
    'ball-tennis',
    'ball-volleyball',
    'balloon',
    'bandage',
    'battery',
    'beach',
    'bed',
    'beer',
    'bike',
    'bone',
    'book',
    'books',
    'bottle',
    'brightness-up',
    'building-community',
    'candy',
    'carrot',
    'cat',
    'christmas-tree',
    'clock-hour-2',
    'coin',
    'device-tv',
    'dog',
    'droplet',
    'friends',
    'ghost',
    'gift',
    'glass-full',
    'globe',
    'headphones',
    'heart',
    'home',
    'hourglass',
    'mountain',
    'paint',
    'pig-money',
    'settings',
    'shopping-bag',
    'shopping-cart',
    'snowboarding',
    'snowman',
    'sofa',
    'stretching',
    'sunglasses',
    'tie',
    'treadmill',
  ];

  @override
  Widget build(BuildContext context) {
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
                  'Выберите иконку',
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
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: availableIcons.length,
              itemBuilder: (context, index) {
                final iconName = availableIcons[index];
                final isSelected = iconName == selectedIcon;

                return GestureDetector(
                  onTap: () {
                    onIconSelected(iconName);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      'assets/icons/$iconName.svg',
                      colorFilter: ColorFilter.mode(
                        isSelected ? AppColors.orange : AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
