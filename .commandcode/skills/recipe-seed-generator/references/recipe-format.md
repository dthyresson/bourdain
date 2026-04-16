# Recipe format

Use this exact object shape for every generated recipe.

## JSON object

```json
{
  "title": "string",
  "cuisine": "string, lowercase",
  "meal_type": "breakfast | lunch | dinner | side | snack",
  "effort": "easy | medium | involved",
  "estimated_time_minutes": 30,
  "spice_level": 0,
  "ingredients": ["ingredient name", "ingredient name"],
  "steps": ["step", "step", "step"],
  "tags": ["tag", "tag"],
  "taste_descriptors": ["descriptor", "descriptor"],
  "notes": "optional short note"
}
```

## Allowed tags

Prefer this controlled vocabulary:
- vegetarian
- seafood
- chicken
- beef
- pork
- tofu
- noodle
- rice
- soup
- salad
- roasted
- stir-fry
- braised
- grilled
- fried
- baked
- curry
- weeknight
- dinner-party
- meal-prep
- comfort-food
- quick

## Allowed taste descriptors

Use only these:
- cozy
- bright
- restrained
- indulgent
- savory
- fresh
- rich
- spicy
- herbal
- smoky
- tangy
- comforting

## Normalization rules

- Ingredient names must not include quantities.
- Ingredient names must not include prep notes like "minced" or "chopped" unless required for identity.
- Keep cuisine lowercase.
- Keep tags lowercase.
- Keep descriptors lowercase.
- Keep notes short.
- Avoid duplicate recipe titles within a single run.
- Prefer realistic, familiar dishes over novelty dishes.
