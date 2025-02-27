import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/common/utils/colors.dart';
import 'package:parimate/common/utils/font_family.dart';
import 'package:parimate/features/chellenges/logic/challenge_type.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/icon_picker_sheet.dart';
import 'widgets/category_picker_sheet.dart';
import 'package:go_router/go_router.dart';

enum RegularityType { daily, weekly, specificDays }

class CreateChallengeSheet extends ConsumerStatefulWidget {
  const CreateChallengeSheet({super.key});

  @override
  ConsumerState<CreateChallengeSheet> createState() =>
      _CreateChallengeSheetState();
}

class _CreateChallengeSheetState extends ConsumerState<CreateChallengeSheet> {
  ChallengeType selectedType = ChallengeType.personal;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? confirmationTime = const TimeOfDay(hour: 23, minute: 59);
  String selectedIcon = '';
  String selectedCategory = '';
  int? maxParticipants;
  bool isPublic = true;
  String selectedRegularity = 'Каждый день';
  int selectedDaysPerWeek = 3;
  String selectedConfirmationType = 'Отправлять фото';
  final List<String> confirmationTypes = [
    'Отправлять фото',
    'Отправлять видео',
    'Отправлять текст',
  ];

  final List<String> regularityOptions = [
    'Единоразово',
    'Каждый день',
    'Каждую неделю',
    'Свой период',
    '2 раз(а) в неделю',
  ];

  final List<bool> selectedDays = List.generate(7, (index) => false);
  final List<String> weekDays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

  int selectedBet = 100;

  @override
  void initState() {
    super.initState();
    // Устанавливаем начальную дату на следующий день
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    startDate = DateTime(tomorrow.year, tomorrow.month, tomorrow.day);
    // Устанавливаем конечную дату через неделю после начальной
    endDate = startDate!
        .add(const Duration(days: 6)); // 6 дней + 1 день начала = 7 дней
  }

  String _formatRegularityText(String regularity) {
    if (regularity == '2 раз(а) в неделю') {
      return '$selectedDaysPerWeek раз(а) в неделю';
    }
    return regularity;
  }

  void _showRegularityPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          decoration: const BoxDecoration(
            color: AppColors.blackMin,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                      'Периодичность',
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
                child: ListView(
                  children: [
                    ...regularityOptions.map((option) {
                      final displayText = _formatRegularityText(option);
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
                            displayText,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                          trailing: selectedRegularity == option
                              ? const Icon(
                                  Icons.check,
                                  color: AppColors.orange,
                                  size: 20,
                                )
                              : null,
                          onTap: () {
                            setState(() {
                              selectedRegularity = option;
                            });
                            Navigator.pop(context);
                            if (option == 'Свой период') {
                              _showDaysPicker();
                            } else if (option == '2 раз(а) в неделю') {
                              _showTimesPerWeekPicker();
                            }
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDaysPicker() {
    // Создаем локальную копию выбранных дней
    List<bool> localSelectedDays = List.from(selectedDays);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          decoration: const BoxDecoration(
            color: AppColors.blackMin,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                      onTap: () {
                        // Применяем изменения при закрытии
                        this.setState(() {
                          selectedDays.setAll(0,
                              localSelectedDays); // Используем setAll вместо цикла
                        });
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Выберите дни',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(7, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              localSelectedDays[index] =
                                  !localSelectedDays[index];
                            });
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: localSelectedDays[index]
                                  ? AppColors.orange
                                  : AppColors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                weekDays[index],
                                style: TextStyle(
                                  color: localSelectedDays[index]
                                      ? AppColors.white
                                      : AppColors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          this.setState(() {
                            selectedDays.setAll(0, localSelectedDays);
                          });
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orange,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Готово',
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
            ],
          ),
        ),
      ),
    );
  }

  void _showTimesPerWeekPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          decoration: const BoxDecoration(
            color: AppColors.blackMin,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                      'Раз в неделю',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      '$selectedDaysPerWeek раз(а) в неделю',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                    Slider(
                      value: selectedDaysPerWeek.toDouble(),
                      min: 1,
                      max: 7,
                      divisions: 6,
                      activeColor: AppColors.orange,
                      inactiveColor: AppColors.grey.withValues(alpha: 0.2),
                      onChanged: (value) {
                        // Обновляем оба состояния
                        setModalState(() {
                          selectedDaysPerWeek = value.toInt();
                        });
                        setState(() {
                          selectedDaysPerWeek = value.toInt();
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orange,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Готово',
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
            ],
          ),
        ),
      ),
    );
  }

  void _showTimePicker() async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: AppColors.blackMin,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                  Text(
                    'До',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontFamily: AppFontFamily.uncage,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: AppColors.blackMin,
              child: SafeArea(
                top: false,
                child: CupertinoTheme(
                  data: const CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                        color: AppColors.orange,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: true,
                    initialDateTime: DateTime(
                      2024,
                      1,
                      1,
                      confirmationTime?.hour ?? 23,
                      confirmationTime?.minute ?? 59,
                    ),
                    backgroundColor: AppColors.blackMin,
                    onDateTimeChanged: (DateTime newTime) {
                      setState(() {
                        confirmationTime = TimeOfDay.fromDateTime(newTime);
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDateRangePicker() async {
    // Получаем завтрашний день как минимальную дату
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    final firstDate = DateTime(tomorrow.year, tomorrow.month, tomorrow.day);

    final DateTimeRange? dateRange = await showDateRangePicker(
      context: context,
      firstDate: firstDate, // Устанавливаем минимальную дату как завтра
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange: DateTimeRange(
        start: startDate ?? firstDate,
        end: endDate ?? firstDate.add(const Duration(days: 6)),
      ),
      locale: const Locale('ru', 'RU'),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.orange,
              onPrimary: AppColors.white,
              surface: AppColors.blackMin,
              onSurface: AppColors.white,
              secondary: AppColors.orange,
              onSecondary: AppColors.white,
            ).copyWith(
              secondaryContainer: AppColors.orange.withValues(alpha: 0.3),
            ),
            dialogBackgroundColor: AppColors.blackMin,
          ),
          child: child!,
        );
      },
    );

    if (dateRange != null) {
      final durationInDays =
          dateRange.end.difference(dateRange.start).inDays + 1;

      // Проверяем, кратна ли длительность 7 дням
      if (durationInDays % 7 != 0) {
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: AppColors.blackMin,
              title: const Text(
                'Некорректный период',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Text(
                'Длительность челленджа должна быть кратна 7 дням.\n\nВыберите период, равный целому количеству недель.',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Понятно',
                    style: TextStyle(
                      color: AppColors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      } else {
        // Если длительность кратна 7, устанавливаем выбранные даты
        setState(() {
          startDate = dateRange.start;
          endDate = dateRange.end;
        });
      }
    }
  }

  String _formatDateRange() {
    final DateFormat formatter = DateFormat('dd.MM.yy');
    return '${formatter.format(startDate!)} - ${formatter.format(endDate!)}';
  }

  void _showConfirmationTypePicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: AppColors.blackMin,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                  Text(
                    'Я буду',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontFamily: AppFontFamily.uncage,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: confirmationTypes.map((type) {
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
                        type,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                      trailing: selectedConfirmationType == type
                          ? const Icon(
                              Icons.check,
                              color: AppColors.orange,
                              size: 20,
                            )
                          : null,
                      onTap: () {
                        setState(() {
                          selectedConfirmationType = type;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBetPicker() {
    final TextEditingController betController =
        TextEditingController(text: selectedBet.toString());
    int tempBet = selectedBet;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          decoration: const BoxDecoration(
            color: AppColors.blackMin,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                    Text(
                      'Ставка',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontFamily: AppFontFamily.uncage,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Введите сумму от 100₽ до 10000₽',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: betController,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Введите сумму',
                                hintStyle: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              onChanged: (value) {
                                final newBet = int.tryParse(value) ?? 0;
                                if (newBet > 10000) {
                                  betController.text = '10000';
                                  betController.selection =
                                      TextSelection.fromPosition(
                                    const TextPosition(offset: 5),
                                  );
                                }
                                tempBet =
                                    int.tryParse(betController.text) ?? 100;
                              },
                            ),
                          ),
                          const Text(
                            '₽',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (tempBet >= 100 && tempBet <= 10000) {
                          this.setState(() {
                            selectedBet = tempBet;
                          });
                        }
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Готово',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getHintText() {
    switch (selectedConfirmationType) {
      case 'Отправлять фото':
        return 'Что нужно сфотографировать';
      case 'Отправлять видео':
        return 'Что нужно снять на видео';
      case 'Отправлять текст':
        return 'Что нужно написать';
      default:
        return '';
    }
  }

  void _showIconPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => IconPickerSheet(
        selectedIcon: selectedIcon,
        onIconSelected: (icon) {
          setState(() {
            selectedIcon = icon;
          });
        },
      ),
    );
  }

  void _showCategoryPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => CategoryPickerSheet(
        selectedCategory: selectedCategory,
        onCategorySelected: (category) {
          setState(() {
            selectedCategory = category;
          });
        },
      ),
    );
  }

  Map<String, dynamic> _buildChallengeData() {
    String confirmationType;
    switch (selectedConfirmationType) {
      case 'Отправлять текст':
        confirmationType = 'TEXT';
        break;
      case 'Отправлять видео':
        confirmationType = 'VIDEO';
        break;
      case 'Отправлять фото':
      default:
        confirmationType = 'PHOTO';
    }

    String regularityType;
    int? timesPerDay;
    int? timesPerWeek;
    List<int>? confirmationDays;

    switch (selectedRegularity) {
      case 'Единоразово':
        regularityType = 'ONCE';
        break;
      case 'Каждый день':
        regularityType = 'TIMES_PER_DAY';
        timesPerDay = 1;
        break;
      case 'Каждую неделю':
        regularityType = 'TIMES_PER_WEEK';
        timesPerWeek = 1;
        break;
      case '2 раз(а) в неделю':
        regularityType = 'TIMES_PER_WEEK';
        timesPerWeek = selectedDaysPerWeek;
        break;
      default:
        regularityType = 'TIMES_PER_DAY';
        timesPerDay = 1;
    }

    // Форматируем время в правильный формат HH:mm
    String formattedTime =
        '${confirmationTime?.hour.toString().padLeft(2, '0')}:${confirmationTime?.minute.toString().padLeft(2, '0')}';

    // Определяем тип участия в зависимости от выбранного типа и настроек доступа
    String participationType;
    if (selectedType == ChallengeType.personal) {
      participationType = 'PERSONAL';
    } else {
      // Для группового челленджа проверяем настройку доступа
      participationType = isPublic ? 'PRIVATE_GROUP' : 'GROUP';
    }

    return {
      'name': nameController.text,
      'participation_type': participationType,
      'icon': selectedIcon,
      'category': selectedCategory,
      'confirmation_type': confirmationType,
      'start_date': DateFormat('yyyy-MM-dd').format(startDate!),
      'end_date': DateFormat('yyyy-MM-dd').format(endDate!),
      'regularity_type': regularityType,
      'times_per_day': timesPerDay,
      'times_per_week': timesPerWeek,
      'confirmation_days': confirmationDays,
      'confirmation_description': descriptionController.text,
      'author_tg_id': '44',
      'price': selectedBet,
      'currency': 'RUB',
      'confirm_until': formattedTime,
      'max_participants': maxParticipants ?? 36,
    };
  }

  void _createChallenge() {
    if (_validateForm()) {
      final challengeData = _buildChallengeData();
      context.push('/challenge-preview', extra: {
        'challenge': challengeData,
        'isCreating': true,
      });
    }
  }

  bool _validateForm() {
    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите название челленджа')),
      );
      return false;
    }

    if (descriptionController.text.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните описание челленджа')),
      );
      return false;
    }

    if (selectedIcon.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Выберите иконку челленджа')),
      );
      return false;
    }

    if (selectedCategory.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Выберите категорию челленджа')),
      );
      return false;
    }

    if (descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите описание челленджа')),
      );
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 8),
                Text(
                  'НОВЫЙ ЧЕЛЛЕНДЖ',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFontFamily.uncage,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: ChallengeType.values.map((type) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedType = type),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedType == type
                            ? AppColors.blackMin
                            : AppColors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        type.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: selectedType == type
                              ? AppColors.white
                              : AppColors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildInputSection([
                    _buildTextField(
                      'Название',
                      controller: nameController,
                      hint: 'Введите название челленджа',
                      isRequired: true,
                    ),
                    _buildSelectField(
                      'Иконка',
                      selectedIcon.isEmpty ? 'Выбрать' : '',
                      onTap: _showIconPicker,
                      icon: selectedIcon.isNotEmpty
                          ? SvgPicture.asset(
                              'assets/icons/$selectedIcon.svg',
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                AppColors.grey,
                                BlendMode.srcIn,
                              ),
                            )
                          : null,
                    ),
                    _buildSelectField(
                      'Категория',
                      selectedCategory.isEmpty ? 'Выбрать' : selectedCategory,
                      onTap: _showCategoryPicker,
                    ),
                  ]),
                  const SizedBox(height: 16),
                  _buildInputSection([
                    if (selectedType == ChallengeType.personal)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildTextField(
                            'Я буду',
                            controller: descriptionController,
                            value: selectedConfirmationType,
                            onTap: _showConfirmationTypePicker,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: descriptionController,
                              style: const TextStyle(color: AppColors.white),
                              decoration: InputDecoration(
                                hintText: selectedConfirmationType ==
                                        'Отправлять фото'
                                    ? 'Что должно быть на фото'
                                    : selectedConfirmationType ==
                                            'Отправлять видео'
                                        ? 'Что должно быть на видео'
                                        : selectedConfirmationType ==
                                                'Отправлять текст'
                                            ? 'Что нужно написать'
                                            : '',
                                hintStyle: TextStyle(
                                    color:
                                        AppColors.grey.withValues(alpha: 0.5)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildTextField(
                            'Каждый должен',
                            controller: descriptionController,
                            value: selectedConfirmationType,
                            onTap: _showConfirmationTypePicker,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: descriptionController,
                              style: const TextStyle(color: AppColors.white),
                              decoration: InputDecoration(
                                hintText: selectedConfirmationType ==
                                        'Отправлять фото'
                                    ? 'Что должно быть на фото'
                                    : selectedConfirmationType ==
                                            'Отправлять видео'
                                        ? 'Что должно быть на видео'
                                        : selectedConfirmationType ==
                                                'Отправлять текст'
                                            ? 'Что нужно написать'
                                            : '',
                                hintStyle: TextStyle(
                                    color:
                                        AppColors.grey.withValues(alpha: 0.5)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ]),
                  const SizedBox(height: 16),
                  _buildInputSection([
                    _buildSelectField('Периодичность',
                        _formatRegularityText(selectedRegularity),
                        onTap: _showRegularityPicker),
                  ]),
                  const SizedBox(height: 16),
                  _buildInputSection([
                    _buildSelectField(
                        'До', confirmationTime?.format(context) ?? '00:00',
                        onTap: _showTimePicker),
                  ]),
                  const SizedBox(height: 16),
                  _buildInputSection([
                    _buildSelectField('Начало/Конец', _formatDateRange(),
                        onTap: _showDateRangePicker),
                  ]),
                  const SizedBox(height: 16),
                  _buildInputSection([
                    _buildSelectField('Или', 'Проиграю $selectedBet ₽',
                        onTap: _showBetPicker),
                  ]),
                  if (selectedType == ChallengeType.group) ...[
                    const SizedBox(height: 16),
                    _buildInputSection([
                      _buildSlider('Количество участников', 36),
                      _buildSwitch('Доступ по ссылке', isPublic),
                    ]),
                  ],
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _createChallenge,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Создать челлендж',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputSection(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.blackMin,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }

  Widget _buildSelectField(
    String label,
    String value, {
    required VoidCallback onTap,
    Widget? icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                if (icon != null) ...[
                  icon,
                  const SizedBox(width: 8),
                ],
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.grey,
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.grey,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label, {
    required TextEditingController controller,
    String? hint,
    String? value,
    bool isRequired = false,
    VoidCallback? onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.blackMin,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (isRequired)
                    Text(
                      ' *',
                      style: TextStyle(
                        color: AppColors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ],
              ),
              if (value != null)
                InkWell(
                  onTap: onTap,
                  child: Row(
                    children: [
                      Text(
                        value,
                        style: const TextStyle(
                          color: AppColors.grey,
                        ),
                      ),
                      if (onTap != null)
                        const Icon(
                          Icons.chevron_right,
                          color: AppColors.grey,
                          size: 20,
                        ),
                    ],
                  ),
                ),
            ],
          ),
          if (hint != null) ...[
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              style: const TextStyle(color: AppColors.white),
              decoration: InputDecoration(
                hintText: _getHintText(),
                hintStyle:
                    TextStyle(color: AppColors.grey.withValues(alpha: 0.5)),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSlider(String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text('1', style: TextStyle(color: AppColors.grey)),
            Expanded(
              child: Column(
                children: [
                  SliderTheme(
                    data: SliderThemeData(
                      overlayShape: SliderComponentShape.noOverlay,
                    ),
                    child: Slider(
                      value: maxParticipants?.toDouble() ?? value,
                      min: 1,
                      max: 100,
                      activeColor: AppColors.orange,
                      inactiveColor: AppColors.grey.withValues(alpha: 0.2),
                      onChanged: (newValue) {
                        setState(() {
                          maxParticipants = newValue.toInt();
                        });
                      },
                    ),
                  ),
                  Text(
                    '${maxParticipants ?? value.toInt()}',
                    style: const TextStyle(
                      color: AppColors.orange,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Text('100', style: TextStyle(color: AppColors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildSwitch(String label, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Switch(
          value: value,
          onChanged: (newValue) {
            setState(() {
              isPublic = newValue;
            });
          },
          activeColor: AppColors.orange,
        ),
      ],
    );
  }
}
