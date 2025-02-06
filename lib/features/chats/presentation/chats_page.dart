import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/utils/colors.dart';
import '../../../common/utils/font_family.dart';
import '../../../common/widgets/main_appbar_widget.dart';
import '../logic/chats_notifier.dart';
import 'widgets/chat_item_widget.dart';

class ChatsPage extends ConsumerStatefulWidget {
  const ChatsPage({super.key});

  @override
  ConsumerState<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends ConsumerState<ChatsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(chatsNotifierProvider.notifier).loadChats("44"));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatsNotifierProvider);

    return Scaffold(
      appBar: const MainAppbarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ЧАТЫ',
                style: TextStyle(
                  fontFamily: AppFontFamily.uncage,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (state.isLoading)
              const Center(
                  child: CircularProgressIndicator(
                color: AppColors.orange,
              ))
            else if (state.error != null)
              Center(
                  child: Text(state.error!,
                      style: TextStyle(color: AppColors.white)))
            else
              Expanded(
                child: ListView.separated(
                  itemCount: state.chats.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final chat = state.chats[index];
                    return ChatItemWidget(chat: chat);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
