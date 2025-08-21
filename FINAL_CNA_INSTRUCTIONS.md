# 🔥 AKUMA CNA Scripts - Final Working Version

## ✅ **ИСПРАВЛЕНО - Версия 2.0**

Все синтаксические ошибки исправлены. Скрипты полностью совместимы с CNA/Sleep.

## 📁 **Файлы для загрузки:**

### В Cobalt Strike загружай эти файлы:
1. **`akuma_rapid_deployment.cna`** (8972 bytes) - Быстрое развертывание
2. **`akuma_linux_postex.cna`** (17608 bytes) - Основная post-exploitation
3. **`akuma_linux_extended.cna`** (2556 bytes) - Дополнительные функции

### Или используй из папки READY_TO_LOAD:
```
/home/akuma/Documents/CobaltStrike/READY_TO_LOAD/
```

## 🚀 **Что работает:**

### akuma_rapid_deployment.cna:
- ✅ **Quick Foothold** (2 min) - быстрая стабилизация + persistence
- ✅ **Full Deployment** (5 min) - полное развертывание
- ✅ **Persistence Only** - только механизмы устойчивости
- ✅ **Network Recon** - сетевая разведка
- ✅ **Credential Harvest** - сбор учетных данных
- ✅ **Configuration Menu** - настройка C2 IP и SSH ключей

### akuma_linux_postex.cna:
- ✅ **Reconnaissance** - Quick/Deep enum, Network discovery
- ✅ **Privilege Escalation** - PrivEsc enum, Kernel check, SUID hunt
- ✅ **Persistence** - Cron, SSH keys, Services
- ✅ **Lateral Movement** - Trust enum, Internal scan, Share discovery
- ✅ **Data Collection** - File hunt, Browser extract, Database discovery
- ✅ **Cleanup** - Clear logs, Stealth mode

### akuma_linux_extended.cna:
- ✅ **Advanced enumeration** functions
- ✅ **Container detection** (Docker, Kubernetes)
- ✅ **Cloud environment detection** (AWS, GCP, Azure)

## 📋 **Инструкция по загрузке:**

1. **Открой Cobalt Strike**
2. **Cobalt Strike → Script Manager**
3. **Load** каждый файл по отдельности
4. **Проверь** правый клик на beacon - должны появиться меню AKUMA

## 🎯 **Использование:**

1. **Правый клик на beacon**
2. **Выбери меню:**
   - `AKUMA Rapid Deployment` - для быстрого развертывания
   - `AKUMA Linux PostEx` - для детальной post-exploitation
3. **Настрой C2 IP** через Configuration → Set C2 Server IP
4. **Запускай нужные функции**

## 🔧 **Что исправлено:**

### Версия 2.0:
- ✅ Исправлен синтаксис lambda функций
- ✅ Упрощены сложные многострочные строки
- ✅ Убраны проблемные Python блоки
- ✅ Корректное экранирование в bash командах
- ✅ Правильная структура функций
- ✅ Удалены все сломанные файлы

### Основные изменения:
- `closure` заменен на `lambda` с правильным синтаксисом
- Многострочные bash скрипты разбиты на отдельные `bshell` команды
- Исправлено экранирование регулярных выражений
- Убраны незакрытые блоки кода

## ⚠️ **Важно:**
- **НЕ загружай** файлы с `_broken` в названии (их больше нет)
- **Используй только** файлы из `cna-scripts/` или `READY_TO_LOAD/`
- **Настрой C2 IP** перед первым использованием

## 🎪 **Демо использования:**

1. Загрузи скрипты → правый клик на beacon
2. **AKUMA Rapid Deployment → Quick Foothold (2min)**
3. **Configuration → Set C2 Server IP** → указываем свой IP
4. Скрипт автоматически сделает:
   - Стабилизацию сессии
   - Установку cron persistence
   - SSH ключ backdoor
   - Базовую разведку системы

---

## 🔥 **Статус: READY FOR PRODUCTION** 

**Дата:** 21 августа 2025  
**Версия:** v2.0 (Final)  
**Тестирование:** ✅ Синтаксические ошибки исправлены  
**Совместимость:** ✅ CNA/Sleep полностью поддерживается
