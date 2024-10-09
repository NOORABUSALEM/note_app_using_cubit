import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:note/core/styles/color_constants.dart';
import 'package:note/features/note/cubit/edit_note_cubit/edit_note_cubit.dart';
import 'package:note/features/note/cubit/note_alert_cubit/alert_note_cubit.dart';
import 'package:note/features/note/cubit/note_cubit/note_cubit.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditNoteCubit(),
        ),
        BlocProvider(
          create: (context) => AlertNoteCubit(),
        ),
        BlocProvider(
          create: (context) => NoteCubit(),
        ),
      ],
      child: const NoteScreenView(),
    );
  }
}

class NoteScreenView extends StatelessWidget {
  const NoteScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: BlocBuilder<EditNoteCubit, EditNoteState>(
            builder: (context, state) {
          return switch (state) {
            EditNoteEdit() => AppBar(
                leading: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BackButton(),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<EditNoteCubit>().watch();
                    },
                    icon: const Icon(Icons.remove_red_eye_outlined),
                  ),
                  const Gap(16),
                  IconButton(
                    onPressed: () {
                      context.read<NoteCubit>().onSaveButtonSubmitted();
                    },
                    icon: const Icon(Icons.save),
                  ),
                  const Gap(16),
                ],
              ),
            EditNoteWatch() => AppBar(
                leading: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BackButton(),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<EditNoteCubit>().edit();
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  const Gap(16),
                ],
              ),
          };
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BlocListener<NoteCubit, NoteState>(
              listener: (context, state) {
                switch (state) {
                  case NoteInitial():
                    context.read<AlertNoteCubit>().init();
                    break;
                  case NoteLoading():
                    context.read<AlertNoteCubit>().loading();
                    break;
                  case NoteSuccess():
                    context
                        .read<AlertNoteCubit>()
                        .success("Alert created successfully.");
                    break;
                  case NoteError():
                    context.read<AlertNoteCubit>().error(state.message);
                    break;
                }
              },
              child: BlocBuilder<AlertNoteCubit, AlertNoteState>(
                  builder: (context, state) {
                print("Hello world");

                return switch (state) {
                  AlertNoteInitial() => const SizedBox.shrink(),
                  AlertNoteLoading() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  AlertNoteSuccess() => StatusMessageWidget.success(
                      message: state.message,
                      onPressed: () {
                        context.read<AlertNoteCubit>().init();
                      },
                    ),
                  AlertNoteError() => StatusMessageWidget.error(
                      message: state.message,
                      onPressed: () {
                        context.read<AlertNoteCubit>().init();
                      },
                    ),
                };
              }),
            ),
            const Gap(16),
            Expanded(
              flex: 1,
              child: BlocBuilder<EditNoteCubit, EditNoteState>(
                builder: (context, state) {
                  return TextField(
                    controller: context.watch<NoteCubit>().titleController,
                    readOnly: state.readonly,
                    maxLines: 10,
                    style: Theme.of(context).textTheme.headlineLarge,
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: BlocBuilder<EditNoteCubit, EditNoteState>(
                builder: (context, state) {
                  return TextField(
                    controller:
                        context.watch<NoteCubit>().descriptionController,
                    readOnly: state.readonly,
                    maxLines: 20,
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Enum to define success or error
enum StatusType { success, error }

class StatusMessageWidget extends StatelessWidget {
  final String message;
  final StatusType statusType;
  final void Function() onPressed;

  const StatusMessageWidget({
    super.key,
    required this.message,
    required this.statusType,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Using a switch statement to return the appropriate UI based on statusType
    switch (statusType) {
      case StatusType.success:
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            side: BorderSide(
              width: 3,
              color: Colors.green,
            ),
          ),
          tileColor: Colors.green.shade200,
          title: Text(
            message,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                ),
          ),
          leading: const Icon(
            Icons.check,
            color: Colors.green,
            size: 28,
          ),
          trailing: InkWell(
            onTap: onPressed,
            child: const Icon(
              Icons.cancel_outlined,
              color: AppColors.textColor,
            ),
          ),
        );

      case StatusType.error:
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            side: BorderSide(
              width: 3,
              color: Colors.red,
            ),
          ),
          tileColor: Colors.red.shade200,
          title: Text(
            message,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                ),
          ),
          leading: const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 28,
          ),
          trailing: InkWell(
            onTap: onPressed,
            child: const Icon(
              Icons.cancel_outlined,
              color: AppColors.textColor,
            ),
          ),
        );
    }
  }

  // Named constructor for success
  factory StatusMessageWidget.success({
    required String message,
    required void Function() onPressed,
  }) {
    return StatusMessageWidget(
      message: message,
      statusType: StatusType.success,
      onPressed: onPressed,
    );
  }

  // Named constructor for error
  factory StatusMessageWidget.error({
    required String message,
    required void Function() onPressed,
  }) {
    return StatusMessageWidget(
      message: message,
      statusType: StatusType.error,
      onPressed: onPressed,
    );
  }
}
