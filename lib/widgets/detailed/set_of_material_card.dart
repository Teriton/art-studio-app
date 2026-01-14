import 'package:art_studio_app/models/set_of_materials.dart';
import 'package:flutter/widgets.dart';

class SetOfMaterialCard extends StatelessWidget {
  const SetOfMaterialCard({super.key, required this.setOfMaterial});

  final SetOfMaterial setOfMaterial;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${setOfMaterial.material.name} ${setOfMaterial.quantity} ${setOfMaterial.material.unit}",
    );
  }
}
