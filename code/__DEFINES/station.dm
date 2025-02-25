#define STATION_TRAIT_POSITIVE 1
#define STATION_TRAIT_NEUTRAL 2
#define STATION_TRAIT_NEGATIVE 3

<<<<<<< HEAD
/// For traits that shouldn't be selected, like abstract types (wow)
#define STATION_TRAIT_ABSTRACT (1<<0)
=======
///Defines for the cost of different station traits. This one is the default.
#define STATION_TRAIT_COST_FULL 1
///Cost for smaller traits that could fly under the radar, and are only minorly negative/positive if not neutral.
#define STATION_TRAIT_COST_LOW 0.5
///Cost for very little, and mainly neutral traits that hardly amount to anything really that interesting.
#define STATION_TRAIT_COST_MINIMAL 0.3

>>>>>>> a59cebea564 (Increased odds of station traits a little. Introduced a "budget", so smaller traits only take half as much space. (#80211))
/// Only run on planet stations
#define STATION_TRAIT_PLANETARY (1<<1)
/// Only run on space stations
<<<<<<< HEAD
#define STATION_TRAIT_SPACE_BOUND (1<<2)
=======
#define STATION_TRAIT_SPACE_BOUND (1<<1)
/// Only run if AIs are enabled.
#define STATION_TRAIT_REQUIRES_AI (1<<2)
>>>>>>> 9ac81e1a648 (New station trait job: Human AI (#81681))

/// Not restricted by space or planet, can always just happen
#define STATION_TRAIT_MAP_UNRESTRICTED STATION_TRAIT_PLANETARY | STATION_TRAIT_SPACE_BOUND

/// The data file that future station traits forced by an admin are stored in
#define FUTURE_STATION_TRAITS_FILE "data/future_station_traits.json"

/// The amount of time until the station charter can no longer be used to rename the station
#define STATION_RENAME_TIME_LIMIT 5 MINUTES
