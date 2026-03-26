# Laravel Project Clonen & Opstarten

## Repository clonen

```bash
git clone https://github.com/Yaman69420/gazettemaster.git
cd gazettemaster
```

## Dependencies installeren

```bash
composer install
npm install
```

## Environment file instellen (PHPStorm)

Kopieer in PHPStorm het bestand `.env.example` en hernoem dit naar `.env`.

## App key genereren

```bash
php artisan key:generate
```

## Database configureren

Pas je `.env` bestand aan:

```env
DB_DATABASE=dblaravelclone
DB_USERNAME=root
DB_PASSWORD=
```

## Database importeren

Er is een database dump aanwezig in `database/database.sql` met alle data (artikels, gebruikers, categorieën, media).

**Via phpMyAdmin:**
1. Maak een nieuwe database aan met de naam uit je `.env`
2. Klik op "Importeren" en selecteer `database/database.sql`

**Via de terminal:**
```bash
mysql -u root -p dblaravelclone < database/database.sql
```

> Je kan ook migreren zonder data:
> ```bash
> php artisan migrate
> ```

## Storage linken (belangrijk)

```bash
php artisan storage:link
```

Zorgt ervoor dat uploads (zoals afbeeldingen) zichtbaar zijn via `/storage`.

## Server starten

```bash
composer run dev
```

Ga naar: [http://127.0.0.1:8000](http://127.0.0.1:8000)

> Dit start tegelijk de webserver, queue worker en Vite dev server op.

## Cache clearen bij problemen (optioneel)

```bash
php artisan config:clear
php artisan cache:clear
php artisan view:clear
```

## Veelvoorkomende problemen

### Afbeeldingen worden niet getoond

Controleer of `php artisan storage:link` werd uitgevoerd.

### .env wijzigingen werken niet

```bash
php artisan config:clear
```

### Composer fouten

```bash
php -v
```

### `composer run dev` werkt niet

```bash
npm install
composer run dev
```

## Vereisten

* PHP >= 8.4
* Composer
* Node.js + npm
* MySQL of MariaDB

## Klaar

Het project zou nu correct moeten draaien.
