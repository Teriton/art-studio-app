import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key, required this.onNextButton});

  final void Function() onNextButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        Card(
          margin: .symmetric(horizontal: 30),
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              spacing: 20,
              children: [
                Text(
                  "Добро пожаловать",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  textAlign: .justify,
                  style: Theme.of(context).textTheme.bodyMedium,
                  "Это приложение для записи на все возможные крутые меропритятия нашей студии, здесь тебя ждут крутые мастера, дружный калектив и вообще все круто.",
                ),

                Row(
                  mainAxisAlignment: .end,
                  children: [
                    ElevatedButton(
                      onPressed: onNextButton,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                      ),
                      child: Text("Далее"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
