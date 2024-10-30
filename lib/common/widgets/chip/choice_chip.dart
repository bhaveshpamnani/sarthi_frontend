import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/container/circular_container.dart';

class SChoiceChip extends StatelessWidget {
  const SChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = SHelperFuctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        shape: isColor? const CircleBorder() : null,
        backgroundColor:isColor ? SHelperFuctions.getColor(text)! : null,
        labelPadding: isColor  ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        labelStyle: TextStyle(color: selected ? SColors.white : null),
        avatar:isColor ? SCircularContainer(width: 50,height: 50,backgroundColor: SHelperFuctions.getColor(text)!,) : null,
      ),
    );
  }
}
