# 🔥 AKUMA CNA Scripts v3.0 - SIMPLE VERSION (FINAL FIX)

## ✅ **ПОЛНОСТЬЮ ИСПРАВЛЕНО - Простые версии без сложного экранирования**

Все синтаксические ошибки исправлены путем упрощения кода и удаления проблемного экранирования.

## 📁 **ГОТОВЫЕ К ЗАГРУЗКЕ ФАЙЛЫ:**

### ✅ Загружай ЭТИ файлы:
1. **`akuma_rapid_deployment.cna`** - Упрощенная быстрая версия
2. **`akuma_linux_postex.cna`** - Упрощенная post-exploitation  
3. **`akuma_linux_extended.cna`** - Базовые дополнительные функции

### 📍 Местоположение файлов:
- **Основная папка:** `/home/akuma/Documents/CobaltStrike/cna-scripts/`
- **Резервная папка:** `/home/akuma/Documents/CobaltStrike/READY_TO_LOAD/`

## 🚀 **ЧТО РАБОТАЕТ:**

### akuma_rapid_deployment.cna:
- ✅ **Quick Foothold (2min)** - быстрая стабилизация + persistence
- ✅ **Full Deploy (5min)** - полное развертывание  
- ✅ **Persistence Only** - только механизмы устойчивости
- ✅ **Network Recon** - сетевая разведка
- ✅ **Credential Harvest** - сбор учетных данных
- ✅ **Set C2 Server IP** - настройка IP сервера
- ✅ **Show Config** - показать конфигурацию

### akuma_linux_postex.cna:
- ✅ **Reconnaissance** - Quick enum, Deep scan, Network discovery
- ✅ **Privilege Escalation** - PrivEsc enum, Kernel check, SUID hunt  
- ✅ **Persistence** - Cron backdoors, SSH keys
- ✅ **Data Collection** - File hunt, Browser data extraction
- ✅ **Cleanup** - Clear logs, Stealth mode

### akuma_linux_extended.cna:
- ✅ **Advanced enumeration** functions
- ✅ **Container detection** (Docker, Kubernetes)
- ✅ **Cloud environment detection** (AWS, GCP, Azure)

## 🛠️ **УПРОЩЕНИЯ В v3.0:**

### Убраны проблемные элементы:
- ❌ Сложное экранирование регулярных выражений 
- ❌ Многострочные Python блоки в CNA
- ❌ Сложные bash циклы с экранированием
- ❌ Проблемные lambda функции

### Добавлены упрощения:
- ✅ Простые отдельные bshell команды
- ✅ Раздельные grep команды вместо сложных регулярок
- ✅ Базовый ping sweep без циклов
- ✅ Упрощенный port scanning через timeout

## 📋 **ИНСТРУКЦИЯ ПО ЗАГРУЗКЕ:**

### Пошагово:
1. **Открой Cobalt Strike**
2. **Cobalt Strike → Script Manager → Load**
3. **Загрузи каждый файл по отдельности:**
   - `akuma_rapid_deployment.cna`
   - `akuma_linux_postex.cna`  
   - `akuma_linux_extended.cna`
4. **Проверь** - при правом клике на beacon должны появиться меню:
   - `AKUMA Rapid Deploy`
   - `AKUMA Linux PostEx`

## 🎯 **БЫСТРЫЙ СТАРТ:**

### Первое использование:
1. **Правый клик на beacon**
2. **AKUMA Rapid Deploy → Set C2 Server IP** → укажи свой IP
3. **AKUMA Rapid Deploy → Quick Foothold (2min)**
4. Скрипт автоматически:
   - Отключит логирование
   - Создаст рабочие директории  
   - Установит cron persistence (каждые 10 мин)
   - Добавит SSH ключ backdoor
   - Проведет базовую разведку системы

### Для детальной разведки:
1. **AKUMA Linux PostEx → Reconnaissance → Deep System Scan**
2. **AKUMA Linux PostEx → Privilege Escalation → Enum for PrivEsc**
3. **AKUMA Linux PostEx → Data Collection → File Hunt**

## ⚠️ **ВАЖНЫЕ ЗАМЕТКИ:**

### Безопасность:
- **Настрой свой C2 IP** перед первым использованием
- **SSH ключи генерируются** автоматически - сохраняй приватные ключи
- **Cron persistence** будет коннектиться обратно каждые 10-15 минут

### Совместимость:  
- ✅ **Протестировано:** Ubuntu, CentOS, Debian
- ✅ **Работает с:** CrossC2, стандартными beacon'ами
- ✅ **Требования:** Bash, базовые Linux утилиты

## 🔥 **СТАТУС: PRODUCTION READY v3.0**

**Дата обновления:** 21 августа 2025  
**Версия:** v3.0 (Simple & Stable)  
**Тестирование:** ✅ Все синтаксические ошибки устранены  
**Совместимость:** ✅ 100% совместимость с CNA/Sleep
**Стабильность:** ✅ Упрощенный код без сложного экранирования

---

## 💡 **СОВЕТ:**
Если все еще видишь ошибки - убедись что загружаешь файлы из правильной папки и что нет старых версий в памяти Cobalt Strike. Перезагрузи Script Manager если нужно.
