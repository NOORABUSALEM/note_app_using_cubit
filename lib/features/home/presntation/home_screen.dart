import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:note/sahred/note_service/model/note_model.dart';

const placeholderText =
    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a g";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          SearchAnchor(
            builder: (context, controller) {
              return IconButton(
                onPressed: () {
                  controller.openView();
                },
                icon: const Icon(Icons.search_outlined),
              );
              //   SearchBar(
              //   elevation: const WidgetStatePropertyAll(0),
              //   controller: controller,
              //   padding: const WidgetStatePropertyAll(
              //     EdgeInsets.symmetric(horizontal: 16.0),
              //   ),
              //   onTap: () {
              //     controller.openView();
              //   },
              //   onChanged: (_) {
              //     controller.openView();
              //   },
              //   leading: const Icon(Icons.search),
              // );
            },

            suggestionsBuilder: (context, controller) {
              return List.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {},
                );
              });
            },
          ),
          const Gap(16),
          IconButton(
            onPressed: () {
              showAboutInfoDialog(context);
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(16),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const NoteCard(
                    note: NoteModel(),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Gap(16);
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAboutInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final titleLargeStyle = Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.w200);

        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Designed by -',
                  style: titleLargeStyle,
                ),
                Text(
                  "Redesigned by -",
                  style: titleLargeStyle,
                ),
                Text(
                  "Illustrations -",
                  style: titleLargeStyle,
                ),
                Text(
                  "Icons -",
                  style: titleLargeStyle,
                ),
                Text(
                  "Font -",
                  style: titleLargeStyle,
                ),
                Center(
                    child: Text(
                  "Made By",
                  style: titleLargeStyle,
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(
        math.Random.secure().nextInt(255),
        math.Random.secure().nextInt(255),
        math.Random.secure().nextInt(255),
        math.Random.secure().nextInt(255),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text(
            note.title ?? placeholderText,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
