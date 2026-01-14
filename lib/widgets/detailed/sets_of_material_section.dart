import 'package:art_studio_app/models/set_of_materials.dart';
import 'package:art_studio_app/widgets/detailed/set_of_material_card.dart';
import 'package:flutter/widgets.dart';

class SetsOfMaterialSection extends StatelessWidget {
  const SetsOfMaterialSection({super.key, required this.setsOfMaterials});

  final List<SetOfMaterial> setsOfMaterials;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          for (var set in setsOfMaterials)
            SetOfMaterialCard(setOfMaterial: set),
        ],
      ),
    );
  }
}
