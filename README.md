# Place on Map

A Flutter app for saving and managing personal locations on an interactive map. Tap anywhere on the map to pin a place, give it a name, and find it later in your list.

## Features

- **Interactive map** — powered by OpenStreetMap via `flutter_map`
- **Add places** — tap anywhere on the map to open a dialog and name the location
- **Place list** — browse all saved places 
- **Delete places** — remove entries from both the list and the map
- **Persistent storage** — all data stored locally with Hive (no internet required after map tiles load)


## Tech Stack

| Layer | Technology |
|---|---|
| UI | Flutter + Cupertino widgets |
| State management | flutter_bloc (Cubit) |
| Navigation | go_router |
| Map | flutter_map + OpenStreetMap tiles |
| Local storage | Hive |
| Date formatting | intl |


## Getting Started

### Prerequisites

- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`

### Installation

```bash
git clone https://github.com/vanneq/place_on_map.git
cd place_on_map
flutter pub get
```

### Code generation (Hive adapters)

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Run

```bash
flutter run
```

## Architecture

State is managed with a single `PlaceCubit` that exposes four states:

```
PlaceInitial  -  loading
PlaceLoaded   -  list of places
PlaceIsEmpty  -  no places yet
PlaceError    -  something went wrong
```

