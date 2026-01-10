import 'package:art_studio_app/models/workshop.dart';
import 'package:art_studio_app/providers/workshop_api_repository_provider.dart';
import 'package:art_studio_app/widgets/detailed/sessions_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailedWorkshopScreen extends ConsumerStatefulWidget {
  const DetailedWorkshopScreen({super.key, required this.workshop});
  final WorkshopRel workshop;

  @override
  ConsumerState<DetailedWorkshopScreen> createState() =>
      _DetailedWorkshopScreenState();
}

class _DetailedWorkshopScreenState
    extends ConsumerState<DetailedWorkshopScreen> {
  WorkshopAllRel? workshopAllRel;

  Future<void> _initWorkshop() async {
    final repo = await ref.read(workshopRepositoryProvider.future);
    final newWorkhopAllRel = await repo.getWorkshopAllRelById(
      widget.workshop.id,
    );

    setState(() {
      workshopAllRel = newWorkhopAllRel;
    });
  }

  @override
  void initState() {
    super.initState();
    _initWorkshop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.workshop.title)),
      body: Column(
        children: [
          if (widget.workshop.image.isNotEmpty)
            SizedBox(
              height: 200,
              child: Hero(
                tag: widget.workshop.id,
                child: Image.network(
                  fit: .cover,
                  widget.workshop.image,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Icon(Icons.broken_image));
                  },
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          Container(
            width: .infinity,
            padding: .all(8),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(widget.workshop.description),
                Column(
                  children: [
                    Text("Мастер"),
                    Text(
                      "${widget.workshop.master.firstName} ${widget.workshop.master.lastName}",
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("Стоимость"),
                    Text("${widget.workshop.fee} руб."),
                  ],
                ),
                Column(
                  children: [
                    Text("Продолжительнсть"),
                    Text("${widget.workshop.duration} мин."),
                  ],
                ),
                Column(
                  children: [
                    Text("Техника"),
                    Text(widget.workshop.technique.name),
                  ],
                ),
              ],
            ),
          ),
          if (workshopAllRel == null) CircularProgressIndicator(),
          if (workshopAllRel != null) SessionsSection(),
        ],
      ),
    );
  }
}
