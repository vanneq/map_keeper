import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:place_on_map/core/cubit/place_cubit.dart';
import 'package:place_on_map/core/cubit/place_state.dart';
import 'package:place_on_map/features/place/widgets/place_card.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({super.key});

  @override
  State<PlacePage> createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  String searchValue = '';

  @override
  void initState() {
    super.initState();
    context.read<PlaceCubit>().loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: const Text(
          "My place",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        trailing: GestureDetector(
          onTap: () {
            context.go('/map');
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CupertinoColors.black,
            ),
            child: const Icon(
              CupertinoIcons.plus,
              color: CupertinoColors.white,
              size: 24,
            ),
          ),
        ),
      ),
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 20),
              child: SearchField(
                onChanged: (value) => setState(() {
                  searchValue = value;
                }),
              ),
            ),
            Expanded(
              child: BlocBuilder<PlaceCubit, PlaceState>(
                builder: (context, state) {
                  return switch (state) {
                    PlaceInitial() => const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                    PlaceError(:final message) => Center(child: Text(message)),
                    PlaceIsEmpty() => const Center(
                      child: Text("Add new Place"),
                    ),
                    PlaceLoaded(:final placeList) => _buildList(
                      context,
                      placeList,
                    ),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List places) {
    final filtered = searchValue.isEmpty
        ? places
        : places
              .where(
                (p) =>
                    p.title.toLowerCase().contains(searchValue.toLowerCase()),
              )
              .toList();

    if (filtered.isEmpty) {
      return const Center(child: Text('No results'));
    }

    return ListView.separated(
      itemCount: filtered.length,
      separatorBuilder: (context, index) =>
          const Divider(height: 1, color: CupertinoColors.systemGrey5),
      itemBuilder: (context, index) {
        final place = filtered[index];
        return PlaceCard(
          title: place.title,
          createAt: DateFormat('d MMM yyyy').format(place.createAt),
          onDeleteTap: () {
            context.read<PlaceCubit>().deletePlace(place);
          },
        );
      },
    );
  }
}

class SearchField extends StatefulWidget {
  final ValueChanged onChanged;
  const SearchField({super.key, required this.onChanged});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      onChanged: widget.onChanged,
      controller: controller,
      padding: EdgeInsets.symmetric(vertical: 14),
      placeholder: "Search place",
      prefix: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Icon(
          CupertinoIcons.search,
          size: 18,
          color: CupertinoColors.systemGrey2,
        ),
      ),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
