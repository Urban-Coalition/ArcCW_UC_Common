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
All weapons using the same caliber are expected to do the same maximum and minimum damage. Range should be loosely similar, but may vary depending on weapon type. Listed below are all cartridges present, sorted by ammo type.


### Pistol Ammo (pistol)
| Caliber     | Damage | Expected Range
| ----------- | -----  | --------------
| 9x19mm      | 30-17  | 15/50m (pistols); 20/100m (SMGs)
| .357 SIG    | 33-17  | ~
| 10mm Auto   | 35-20  | ~
| .40 S&W     | 30-23  | 8/50m (pistols); 10/100m (SMGs)
| .45 ACP     | 45-15  | 10/50m (pistols); 15/100m (SMGs)
| .380 ACP    | 30-15  | 12/40m (pistols); 16/80m (SMGs)

### Magnum Ammo (357)
| Caliber     | Damage | Expected Range
| ----------- | -----  | --------------
| .50 AE      | 70-17  | 10/120m
| .44 Magnum  | 60-15  | ~
| .357 Magnum | 50-12  | ~
| .50 Beowulf | 70-20  | 15/90m

### Carbine Ammo (smg1)
| Caliber     | Damage | Expected Range
| ----------- | -----  | --------------
| 5.56x45mm   | 34-20  | 50/400m
| .300 BLK    | 40-15  | ~
| 5.45x39mm   | 40-20  | 36/360m

### Rifle Ammo (ar2)
| Caliber     | Damage | Expected Range
| ----------- | -----  | --------------
| 7.62x51mm   | 75-40  | 50/400m
| 7.62x39mm   | 50-25  | 30/300m
| .366 TKM    | 60-30  | 30/300m

### Plinking Ammo (plinking)
| Caliber     | Damage | Expected Range
| ----------- | -----  | --------------
| .22 LR      | 12-7   | ~50m (pistols); ~100m (rifles)

### Shotgun Ammo (buckshot)
We make an exception to the rule for shotguns because most use a single caliber, and auto shotguns can be very powerful.

| Caliber           | Damage    | Expected Range
| ----------------- | --------- | --------------
| 12 Gauge (pump)   | 20-13 x8  | 50m
| 12 Gauge (semi)   | 18-10 x8  | 40m
| .410 Bore         | 18-5 x4   | 60m

### Sniper Ammo (SniperPenetratedRound)
| Caliber      | Damage | Expected Range
| ------------ | -----  | --------------
| .338 Lapua   | 85-160 | 20/100m
| .300 Win Mag | 44-85  | 10/50m