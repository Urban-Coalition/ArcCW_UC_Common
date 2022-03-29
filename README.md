# Urban Coalition Common Pack

Contains universal attachments used by Urban Decay and future weapon packs.

## Slot types:
- "Internals" (uc_fg): Perks related to weapon mechanics.
- "Training Package" (uc_tp): Perks related to weapon user.
- "Ammo Type" (uc_ammo): Bullet type (unrelated to weapon caliber).
- "Ammo Type" (uc_ammo_shotgun): Bullet type for shotguns.
- "Ammo Type" (uc_40mm): Projectile type for 40mm grenade launchers, such as the M79.
- "Powder Load" (uc_powder): Type and amount of gunpowder in the cartridge.
- "Muzzle" (choke): Shotgun-specific chokes.

## Balancing Information

### Caliber
All weapons using the same caliber are expected to do the same penetration and damage. Range should be loosely similar, but may vary depending on weapon type and barrel length. Listed below are all cartridges present, sorted by ammo type.

#### Pistol Ammo (pistol)
| Caliber     | Damage | Penetration | Expected Range
| ----------- | -----  | ----------- |--------------
| 9x19mm      | 30-17  | 6mm         | 15/50m (pistols); 20/100m (SMGs)
| .357 SIG    | 33-17  | 6mm         | ~
| 10mm Auto   | 35-20  | 8mm         | ~
| .40 S&W     | 30-23  | 8mm         | 8/50m (pistols); 10/100m (SMGs)
| .45 ACP     | 45-15  | 9mm         | 10/50m (pistols); 15/100m (SMGs)
| .380 ACP    | 30-15  | 3mm         | 12/40m (pistols); 16/80m (SMGs)

#### Magnum Ammo (357)
| Caliber     | Damage | Penetration | Expected Range
| ----------- | -----  | ----------- |--------------
| .50 AE      | 70-17  | 12mm        | 10/120m
| .44 Magnum  | 60-15  | 10mm        | ~
| .357 Magnum | 50-12  | 9mm         | ~
| .50 Beowulf | 70-20  | 12mm        | 15/90m

#### Carbine Ammo (smg1)
| Caliber     | Damage | Penetration | Expected Range
| ----------- | -----  | ----------- |--------------
| 5.56x45mm   | 34-20  | 14mm        | 50/400m
| .300 BLK    | 40-15  | 10mm        | ~
| 5.45x39mm   | 40-20  | 12mm        | 36/360m

#### Rifle Ammo (ar2)
| Caliber     | Damage | Penetration | Expected Range
| ----------- | -----  | ----------- |--------------
| 7.62x51mm   | 75-40  | 20mm        | 50/400m
| 7.62x39mm   | 50-25  | 16mm        | 30/300m
| .366 TKM    | 60-30  | 18mm        | 30/300m

#### Plinking Ammo (plinking)
| Caliber     | Damage | Penetration | Expected Range
| ----------- | -----  | ----------- | --------------
| .22 LR      | 12-7   | 3mm         |~50m (pistols); ~100m (rifles)

#### Shotgun Ammo (buckshot)
We make an exception to the rule for shotguns because most use a single caliber, and auto shotguns can be very powerful.

| Caliber           | Damage    | Penetration | Expected Range
| ----------------- | --------- | ----------- |--------------
| 12 Gauge (pump)   | 20-13 x8  | 2mm         | 50m
| 12 Gauge (semi)   | 18-10 x8  | 2mm         | 40m
| .410 Bore         | 18-5 x4   | 2mm         | 60m

#### Sniper Ammo (SniperPenetratedRound)
| Caliber      | Damage | Penetration | Expected Range
| ------------ | -----  | ----------- | --------------
| .338 Lapua   | 85-160 | 36mm        | 20/100m
| .300 Win Mag | 44-85  | 24mm        | 10/50m

---
### Damage Multipliers
There are two damage multiplier tables, one for shotguns and one non-shotguns, defined in ``sh_0_uc.lua``.

#### Standard
| Part     | Multiplier |
| -------- | ---------- |
| Head     | 3.5        |
| Chest    | 1.15       |
| Stomach  | 1          |
| Arms     | 0.85       |
| Legs     | 0.5        |

#### Shotgun
| Part     | Multiplier |
| -------- | ---------- |
| Head     | 1.5        |
| Chest    | 1          |
| Stomach  | 1          |
| Arms     | 0.85       |
| Legs     | 0.5        |

---
### Damage Breakpoints
Some ammo types modify damage values. Most notably, JSP by +17%/-15%, and FMJ by -10%/+15%. With the standard damage table, these are some relevant damage thresholds:

| Threshold | Damage | +JSP    | +FMJ    |
| --------- | ------ | ------- | ------- |
| 5x Torso  | 20     | 17/24   | 23/18   |
| 4x Torso  | 25     | 22/30   | 28/22   |
| 1x Head   | 29     | 25/34   | 32/25   |
| 3x Torso  | 34     | 30/40   | 38/30   |
| 2x Chest  | 44     | 38/52   | 48/38   |
| 2x Torso  | 50     | 43/59   | 56/44   |
| 1x Chest  | 87     | 75/103  | 96/75   |
| 1x Torso  | 100    | 86/117  | 111/87  |
| 1x Arms   | 117    | 100/139 | 130/108 |
| One-tap   | 200    | 171/235 | 223/174 |