import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/common/utils/colors.dart';
import 'package:parimate/common/utils/font_family.dart';
import 'package:parimate/features/chellenges/domain/challenge_type.dart';
import 'package:parimate/providers/repository_providers.dart';
import 'package:intl/intl.dart';

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
  TimeOfDay? confirmationTime;
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
    'Отправлять геолокацию',
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

  void _showRegularityPicker() {
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
                    'Периодичность',
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
                children: [
                  ...regularityOptions.map((option) {
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
                          option,
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
                          }
                        },
                      ),
                    );
                  }).toList(),
                  if (selectedRegularity == '2 раз(а) в неделю') ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Slider(
                        value: selectedDaysPerWeek.toDouble(),
                        min: 1,
                        max: 7,
                        divisions: 6,
                        activeColor: AppColors.orange,
                        inactiveColor: AppColors.grey.withOpacity(0.2),
                        onChanged: (value) {
                          setState(() {
                            selectedDaysPerWeek = value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDaysPicker() {
    int timesPerWeek = 1;
    bool isSliderMoved = false;
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
                          for (int i = 0; i < selectedDays.length; i++) {
                            selectedDays[i] = localSelectedDays[i];
                          }
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
                    Text(
                      'Периодичность',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontFamily: AppFontFamily.uncage,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isSliderMoved) ...[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(7, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            localSelectedDays[index] =
                                !localSelectedDays[index];
                            isSliderMoved = false;
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
                ),
              ],
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$timesPerWeek раз(а) в неделю',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: timesPerWeek.toDouble(),
                      min: 1,
                      max: 50,
                      divisions: 49,
                      activeColor: AppColors.orange,
                      inactiveColor: AppColors.grey.withOpacity(0.2),
                      onChanged: (value) {
                        setState(() {
                          timesPerWeek = value.toInt();
                          isSliderMoved = true;
                          // Сбрасываем выбранные дни
                          for (int i = 0; i < localSelectedDays.length; i++) {
                            localSelectedDays[i] = false;
                          }
                        });
                        this.setState(() {
                          selectedDaysPerWeek = timesPerWeek;
                          // Обновляем выбранные дни в основном состоянии
                          for (int i = 0; i < selectedDays.length; i++) {
                            selectedDays[i] = false;
                          }
                        });
                      },
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
              use24hFormat: false,
              initialDateTime: DateTime.now(),
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
    );
  }

  void _showDateRangePicker() async {
    final DateTimeRange? dateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange: DateTimeRange(
        start: startDate ?? DateTime.now(),
        end: endDate ?? DateTime.now().add(const Duration(days: 7)),
      ),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.orange,
              onPrimary: AppColors.white,
              surface: AppColors.blackMin,
              onSurface: AppColors.white,
              secondary: AppColors.orange,
              onSecondary: AppColors.white,
            ),
            dialogBackgroundColor: AppColors.blackMin,
          ),
          child: child!,
        );
      },
    );
    if (dateRange != null) {
      setState(() {
        startDate = dateRange.start;
        endDate = dateRange.end;
      });
    }
  }

  String _formatDateRange() {
    if (startDate != null && endDate != null) {
      final DateFormat formatter = DateFormat('dd.MM.yy');
      return '${formatter.format(startDate!)} - ${formatter.format(endDate!)}';
    }
    return '06.10.24 - 26.10.24';
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
                        final newBet = int.tryParse(betController.text) ?? 100;
                        if (newBet >= 100 && newBet <= 10000) {
                          this.setState(() {
                            selectedBet = newBet;
                          });
                        }
                        Navigator.pop(context);
                      },
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
                    _buildSelectField('Иконка', 'Выбрать', onTap: () {
                      // Показать выбор иконки
                    }),
                    _buildSelectField('Категория', 'Выбрать', onTap: () {
                      // Показать выбор категории
                    }),
                  ]),
                  const SizedBox(height: 16),
                  _buildInputSection([
                    if (selectedType == ChallengeType.personal)
                      _buildTextField(
                        'Я буду',
                        controller: descriptionController,
                        hint: 'Что должно быть на фото',
                        value: selectedConfirmationType,
                        onTap: _showConfirmationTypePicker,
                      )
                    else
                      _buildTextField(
                        'Каждый должен',
                        controller: descriptionController,
                        hint: 'Что должно быть на фото',
                        value: selectedConfirmationType,
                        onTap: _showConfirmationTypePicker,
                      ),
                  ]),
                  const SizedBox(height: 16),
                  _buildInputSection([
                    _buildSelectField('Периодичность', selectedRegularity,
                        onTap: _showRegularityPicker),
                    _buildSelectField(
                        'До', confirmationTime?.format(context) ?? '00:00',
                        onTap: _showTimePicker),
                    _buildSelectField('Начало/Конец', _formatDateRange(),
                        onTap: _showDateRangePicker),
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
                            color: AppColors.white.withOpacity(0.2),
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

  Widget _buildTextField(
    String label, {
    required TextEditingController controller,
    String? hint,
    String? value,
    bool isRequired = false,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
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
                    ),
                ],
              ),
              if (value != null)
                Row(
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
            ],
          ),
          if (hint != null && onTap == null) ...[
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              style: const TextStyle(color: AppColors.white),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: AppColors.grey.withOpacity(0.5)),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSelectField(String label, String value,
      {required VoidCallback onTap}) {
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
                  Slider(
                    value: maxParticipants?.toDouble() ?? value,
                    min: 1,
                    max: 100,
                    activeColor: AppColors.orange,
                    inactiveColor: AppColors.grey.withOpacity(0.2),
                    onChanged: (newValue) {
                      setState(() {
                        maxParticipants = newValue.toInt();
                      });
                    },
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

  void _createChallenge() async {
    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите название челленджа')),
      );
      return;
    }

    final now = DateTime.now();
    final defaultStartDate = DateTime(now.year, now.month, now.day);
    final defaultEndDate = defaultStartDate.add(const Duration(days: 7));

    // Определяем тип регулярности и количество раз в неделю
    String regularityType;
    int? timesPerWeek;
    List<int>? confirmationDays;

    switch (selectedRegularity) {
      case 'Каждый день':
        regularityType = 'TIMES_PER_WEEK';
        timesPerWeek = 7;
        break;
      case 'Раз в неделю':
        regularityType = 'TIMES_PER_WEEK';
        timesPerWeek = 1;
        break;
      case '2 раза в неделю':
        regularityType = 'TIMES_PER_WEEK';
        timesPerWeek = 2;
        break;
      case '3 раза в неделю':
        regularityType = 'TIMES_PER_WEEK';
        timesPerWeek = 3;
        break;
      case 'Конкретные дни':
        regularityType = 'SPECIFIC_DAYS';
        confirmationDays = [];
        for (int i = 0; i < selectedDays.length; i++) {
          if (selectedDays[i]) {
            // Преобразуем в формат API (0 = Понедельник, 6 = Воскресенье)
            confirmationDays.add(i);
          }
        }
        break;
      default:
        regularityType = 'TIMES_PER_WEEK';
        timesPerWeek = 7;
    }

    // Форматируем время в формат HH:mm
    final timeStr = confirmationTime?.format(context).split(' ')[0] ?? '23:59';
    final parts = timeStr.split(':');
    final hour = parts[0].padLeft(2, '0');
    final minute = parts[1].padLeft(2, '0');
    final confirmUntil = '$hour:$minute';

    final challenge = {
      'name': nameController.text.trim(),
      'participation_type':
          selectedType == ChallengeType.personal ? 'PERSONAL' : 'GROUP',
      'icon': selectedIcon.isEmpty ? 'flash' : selectedIcon,
      'category': selectedCategory.isEmpty ? 'Спорт' : selectedCategory,
      'confirmation_type': 'PHOTO',
      'start_date': startDate?.toIso8601String().split('T')[0] ??
          defaultStartDate.toIso8601String().split('T')[0],
      'end_date': endDate?.toIso8601String().split('T')[0] ??
          defaultEndDate.toIso8601String().split('T')[0],
      'regularity_type': regularityType,
      'times_per_day': 0,
      'times_per_week': timesPerWeek,
      if (confirmationDays != null) 'confirmation_days': confirmationDays,
      'confirmation_description': descriptionController.text.trim(),
      'author_tg_id': '44',
      'price': 100,
      'currency': 'RUB',
      'confirm_until': confirmUntil,
      if (selectedType == ChallengeType.group) ...{
        'max_participants': maxParticipants ?? 36,
      },
    };

    try {
      await ref.read(challengeRepositoryProvider).createChallenge(challenge);
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Челлендж успешно создан')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка при создании челленджа: $e')),
        );
      }
    }
  }
}
