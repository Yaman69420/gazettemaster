# GazetteMaster

Laravel CMS met publieke frontend gebouwd op het Gazette HTML-thema.

---

## Vereisten

- PHP 8.4
- MySQL 8.0
- Node.js + npm
- Composer
- MAMP (of een andere lokale server)

---

## Installatie

### 1. Clone de repository

```bash
git clone https://github.com/Yaman69420/gazettemaster.git
cd gazettemaster
```

### 2. Installeer dependencies

```bash
composer install
npm install
```

### 3. Omgevingsbestand aanmaken

```bash
cp .env.example .env
php artisan key:generate
```

### 4. Database instellen

Maak een lege database aan (bijv. `dblaravelclone`) en pas `.env` aan:

```env
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=dblaravelclone
DB_USERNAME=root
DB_PASSWORD=root
```

### 5. Database importeren

Importeer de meegeleverde dump met alle data (artikels, gebruikers, categorieën):

**Via phpMyAdmin:**
1. Open phpMyAdmin
2. Selecteer de database
3. Klik op "Importeren" en selecteer `database/database.sql`

**Via de terminal:**
```bash
mysql -u root -p dblaravelclone < database/database.sql
```

### 6. Storage koppelen

```bash
php artisan storage:link
```

### 7. Frontend assets bouwen

```bash
npm run build
```

### 8. Applicatie starten

```bash
php artisan serve
php artisan queue:listen --tries=1
```

De site is bereikbaar op `http://localhost:8000`

---

## Inloggegevens

Na het importeren van de database kan je inloggen via `/login`:

| Rol   | E-mail                    | Wachtwoord |
|-------|---------------------------|------------|
| Admin | syntraprogrammeurs@gmail.com | password   |

> Wachtwoord te wijzigen via het profiel na het inloggen.

---

## Overzicht pagina's

| URL                    | Beschrijving                        |
|------------------------|-------------------------------------|
| `/`                    | Homepage met featured posts         |
| `/posts`               | Alle artikels met zoekfunctie       |
| `/posts/{slug}`        | Post detailpagina                   |
| `/categories/{slug}`   | Categoriepagina                     |
| `/contact`             | Contactformulier                    |
| `/backend/dashboard`   | Backend (inloggen vereist)          |

---

## Cache clearen bij problemen

```bash
php artisan config:clear
php artisan cache:clear
php artisan view:clear
```
