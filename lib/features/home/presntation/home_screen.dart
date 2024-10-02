import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:note/core/styles/color_constants.dart';
import 'package:note/core/styles/widget_styles.dart';
import 'package:note/features/home/cubit/search_bar_cubit/search_bar_cubit.dart';
import 'package:note/sahred/note_service/model/note_model.dart';

const placeholderText =
    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a g";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBarCubit(),
        )
      ],
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: BlocBuilder<SearchBarCubit, SearchBarState>(
          builder: (context, state) {
            return switch (state) {
              // TODO: Handle this case.
              SearchBarShow() => AppBar(
                  title: CustomSearchBar(
                    controller:
                        context.watch<SearchBarCubit>().searchController,
                  ),
                ),
              // TODO: Handle this case.
              SearchBarHide() => AppBar(
                  title: Text(
                    "Notes",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.read<SearchBarCubit>().show();
                      },
                      icon: const Icon(Icons.search_outlined),
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
            };
          },
        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/note");
        },
        child: const Icon(Icons.add),
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

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.controller,
    this.onChanged,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            context.read<SearchBarCubit>().hide();
          },
          child: const Icon(Icons.close),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        focusedBorder: searchBarStyle,
        enabledBorder: searchBarStyle,
        border: searchBarStyle,
        filled: true,
        fillColor: AppColors.darkBackGroundSearchBar,
      ),
      onChanged: onChanged,
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
