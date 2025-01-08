import 'package:landscape/models/plant_model.dart';

final List<Plant> plants = [
  Plant(
    name: "Lady Palm",
    scientificName: "Rhapis excelsa",
    description:
        "Lady Palm is a graceful and hardy indoor palm known for its lush, fan-shaped fronds and clumping growth habit. Perfect for homes and offices.",
    light: "Prefers indirect light and can tolerate low-light conditions.",
    soil: "Well-draining potting mix designed for palms or houseplants.",
    watering:
        "Water when the top inch of soil feels dry; keep the soil moist but avoid waterlogging.",
    humidity: "Enjoys higher humidity; mist the leaves or use a humidity tray.",
    temperature: "65°F to 80°F (18°C to 27°C); avoid cold drafts.",
    idealUses: [
      "Indoor decorative plant for living rooms, offices, and entryways",
      "Grouped with other houseplants for a tropical look",
      "Used in bright, indirect light areas to create a calming atmosphere"
    ],
    tips: [
      "Prune yellow or dead fronds to maintain a tidy appearance.",
      "Fertilize every 4-6 weeks during the growing season.",
      "Rotate the plant occasionally for even growth."
    ],
  ),
  Plant(
    name: "Calla Lily",
    scientificName: "Zantedeschia",
    description:
        "The Calla Lily is a striking perennial known for its elegant, trumpet-shaped flowers and vibrant colors.",
    light: "Thrives in full sun to partial shade.",
    soil: "Prefers well-drained, fertile soil.",
    watering: "Moderate watering; keep soil consistently moist but not soggy.",
    humidity: "Average indoor humidity is sufficient.",
    temperature: "Grows best in temperatures between 60°F and 80°F.",
    idealUses: [
      "Borders and flower beds",
      "Container gardens",
      "Focal points in landscaping"
    ],
    tips: [
      "Remove spent flowers to encourage new blooms.",
      "Mulch around plants to retain moisture and suppress weeds."
    ],
  ),
  Plant(
    name: "Terrarium",
    scientificName: "Miniature Ecosystem",
    description:
        "A Terrarium is a miniature garden enclosed in glass, creating a self-sustaining ecosystem that is both beautiful and low-maintenance.",
    light: "Bright, indirect light; avoid direct sunlight.",
    soil: "Well-draining potting mix; layering with gravel enhances drainage.",
    watering:
        "Water sparingly; allow the soil to dry slightly between waterings.",
    humidity: "Creates a humid environment; ideal for moisture-loving plants.",
    temperature: "65°F to 75°F (18°C to 24°C).",
    idealUses: [
      "Ferns: Boston Fern, Maidenhair Fern",
      "Moss: Sheet Moss, Cushion Moss",
      "Succulents: Echeveria, Haworthia (for open terrariums)"
    ],
    tips: [
      "Choose plants with similar light and humidity requirements.",
      "Use decorative elements like stones or figurines.",
      "Monitor for mold and remove any dead leaves."
    ],
  ),
  Plant(
    name: "Dracaena Trifasciata",
    scientificName: "Snake Plant",
    description:
        "Known for its striking, upright leaves with green and yellow stripes, this hardy plant is easy to care for and air-purifying.",
    light: "Thrives in low light to bright indirect sunlight.",
    soil: "Well-draining potting soil or a cactus/succulent mix.",
    watering:
        "Water sparingly; allow the soil to dry out completely between waterings.",
    humidity: "Average indoor humidity is sufficient.",
    temperature: "60°F to 80°F (16°C to 27°C).",
    idealUses: [
      "Indoor houseplant for home or office",
      "Decorative accents on shelves or tabletops",
      "Corner plant for visual interest"
    ],
    tips: [
      "Remove dead or damaged leaves for a tidy appearance.",
      "Fertilize every few months during the growing season.",
      "Keep out of reach of pets as it may cause mild discomfort if ingested."
    ],
  ),
  // Add more plants here following the same structure...
  Plant(
    name: "Umbrella Bamboo",
    scientificName: "Fargesia murielae",
    description:
        "A clumping bamboo variety with graceful, arching stems and lush foliage. Ideal for privacy screens or adding a tropical feel to gardens.",
    light: "Partial to full shade; can tolerate some sun.",
    soil: "Well-drained, fertile soil; slightly acidic to neutral pH.",
    watering: "Keep soil consistently moist; avoid waterlogging.",
    humidity: "Enjoys moderate to high humidity; misting can help.",
    temperature: "Hardy in USDA zones 5-9; protect from extreme cold.",
    idealUses: [
      "Privacy screens and windbreaks",
      "Decorative borders or accents in gardens",
      "Container planting for patios and balconies"
    ],
    tips: [
      "Prune dead or damaged canes to encourage healthy growth.",
      "Fertilize in spring with a balanced fertilizer.",
      "Use a root barrier if planting in the ground to prevent spreading."
    ],
  ),
  Plant(
    name: "Bay Laurel",
    scientificName: "Laurus nobilis",
    description:
        "A versatile evergreen shrub or small tree, prized for its aromatic leaves and attractive foliage, commonly used in cooking.",
    light: "Thrives in full sun to partial shade.",
    soil: "Prefers well-drained, loamy soil; can tolerate poor soil.",
    watering: "Water regularly; allow the top inch of soil to dry out.",
    humidity: "Moderate humidity; misting can help in dry environments.",
    temperature: "60°F to 75°F (15°C to 24°C); frost-sensitive.",
    idealUses: [
      "Culinary herb for seasoning dishes",
      "Decorative hedges or topiary shapes in gardens",
      "Potted plant for patios and balconies"
    ],
    tips: [
      "Harvest leaves as needed; older leaves are more flavorful.",
      "Prune regularly to maintain shape and encourage growth.",
      "Protect from harsh winter conditions; bring indoors if potted."
    ],
  ),
  Plant(
    name: "Monstera Plant",
    scientificName: "Monstera deliciosa",
    description:
        "The Swiss Cheese Plant is celebrated for its striking, large, heart-shaped leaves with unique perforations, adding a tropical touch to spaces.",
    light: "Prefers bright, indirect sunlight; can tolerate low light.",
    soil: "Thrives in well-draining potting mix enriched with organic matter.",
    watering: "Water when the top inch of soil feels dry; avoid overwatering.",
    humidity: "Enjoys high humidity; mist regularly or use a humidifier.",
    temperature: "65°F to 85°F (18°C to 29°C).",
    idealUses: [
      "Indoor decorative plant",
      "Outdoor patio or garden feature in warm climates",
      "Ideal for creating tropical-themed spaces"
    ],
    tips: [
      "Provide a moss pole or trellis for climbing support.",
      "Wipe leaves with a damp cloth to keep them dust-free.",
      "Fertilize every 4-6 weeks during the growing season."
    ],
  ),
  Plant(
    name: "Grey Star Calathea",
    scientificName: "Calathea setosa",
    description:
        "A stunning tropical plant with bold, silver-grey striped leaves, perfect for adding elegance to any space.",
    light: "Prefers bright, indirect light; avoid direct sunlight.",
    soil: "Well-drained, fertile soil.",
    watering: "Water when the top inch of soil feels dry; keep soil moist.",
    humidity: "Enjoys high humidity; misting or a humidifier is helpful.",
    temperature: "65°F to 80°F (18°C to 27°C).",
    idealUses: [
      "Indoor plant for tropical-themed decor",
      "Air-purifying plant for homes and offices",
      "Borders or container gardens in shady areas"
    ],
    tips: [
      "Keep soil moist but not waterlogged to avoid root rot.",
      "Rotate occasionally for even growth.",
      "Prune damaged leaves to maintain a tidy appearance."
    ],
  ),
  Plant(
    name: "Ferns",
    scientificName: "Various species",
    description:
        "Lush, ancient plants known for their delicate fronds, thriving in shaded or partially shaded environments.",
    light: "Prefer indirect light or partial shade.",
    soil: "Rich organic, well-draining soil; suitable for tropical plants.",
    watering:
        "Keep soil consistently moist but not soggy; enjoy high humidity.",
    humidity: "High humidity; misting leaves or using a tray helps.",
    temperature: "60°F to 75°F (15°C to 24°C).",
    idealUses: [
      "Understory plants in shaded garden beds",
      "Indoor houseplants for low-light areas",
      "Hanging baskets or terrariums"
    ],
    tips: [
      "Remove dead fronds for healthy growth.",
      "Fertilize lightly during the growing season.",
      "Choose varieties based on specific care needs."
    ],
  ),
];
