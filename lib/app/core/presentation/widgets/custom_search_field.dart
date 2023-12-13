part of 'widgets.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    required this.hintText,
    required this.onChanged,
    super.key,
  });

  final String hintText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        TextField(
          autocorrect: false,
          style: TextStyle(
            fontSize: 17.spMax,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimary,
          ),
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIconColor: theme.colorScheme.background,
            prefixIcon: const Icon(Icons.search),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 17.spMax,
              color: theme.colorScheme.background,
            ),
          ),
        ),
        Container(
          color: theme.colorScheme.background,
          height: 2,
        ),
      ],
    );
  }
}
