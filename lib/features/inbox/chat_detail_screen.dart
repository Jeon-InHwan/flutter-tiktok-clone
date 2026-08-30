import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool get _isSendEnabled {
    return _textController.text.trim().isNotEmpty;
  }

  @override
  void initState() {
    super.initState();

    _textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  void _sendMessage() {
    final message = _textController.text.trim();

    if (message.isEmpty) {
      return;
    }

    _textController.clear();
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: Sizes.size4,
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.all(Sizes.size4),
                child: CircleAvatar(
                  foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/77829187?v=4",
                  ),
                  radius: Sizes.size20,
                  child: Text('JEON'),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: Sizes.size18,
                  height: Sizes.size18,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.white, width: Sizes.size3),
                    borderRadius: BorderRadius.circular(Sizes.size24),
                  ),
                ),
              ),
            ],
          ),
          title: const Text(
            "JEON",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            "Active Now",
            style: TextStyle(
              fontSize: Sizes.size12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        actions: [
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h24,
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView.separated(
              reverse: true,
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: Sizes.size14,
              ),
              itemBuilder: (context, index) {
                final isMine = index % 2 == 0;

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(Sizes.size14),
                      decoration: BoxDecoration(
                        color:
                            !isMine
                                ? Theme.of(context).primaryColor
                                : Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(Sizes.size12),
                          topRight: const Radius.circular(Sizes.size12),
                          bottomLeft:
                              isMine
                                  ? const Radius.circular(Sizes.size12)
                                  : Radius.zero,
                          bottomRight:
                              isMine
                                  ? Radius.zero
                                  : const Radius.circular(Sizes.size12),
                        ),
                      ),
                      child: const Text(
                        "Message",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 12,
            ),
          ),
          BottomAppBar(
            color: Colors.grey.shade50,
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size8,
              horizontal: Sizes.size16,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    focusNode: _focusNode,
                    textInputAction: TextInputAction.send,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    onSubmitted: (_) {
                      _sendMessage();
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size16,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Send a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.size16),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.faceLaugh,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                ),
                Gaps.h16,
                GestureDetector(
                  onTap: _isSendEnabled ? _sendMessage : null,
                  child: Container(
                    padding: const EdgeInsets.all(Sizes.size8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _isSendEnabled
                              ? const Color(0xFF1D9BF0)
                              : Colors.grey.shade400,
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.solidPaperPlane,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
