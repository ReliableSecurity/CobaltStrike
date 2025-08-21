# 🔥 AKUMA's CobaltStrike Deployment Guide 🔥

**Created by AKUMA** - legendary hacker & penetration testing guru 😎

## 📋 Пошаговая инструкция развертывания

### 🚀 Шаг 1: Клонирование репозитория
```bash
git clone https://github.com/sweetpotatohack/AKUMA_CobaltStrike.git
cd AKUMA_CobaltStrike
```

### 🔧 Шаг 2: Настройка путей
```bash
# Запускаем автоматическую настройку путей
./setup_portable.sh
```
**Что делает этот скрипт:**
- 🧠 Автоматически определяет текущую директорию проекта
- 🔄 Обновляет пути в `CrossC2-GithubBot-2023-11-20.cna`
- 🎯 Настраивает все CrossC2Kit компоненты
- 💾 Создает backup'ы всех изменяемых файлов

**Альтернативно можно использовать:**
```bash
./fix_paths.sh      # Простое обновление путей
./check_paths.sh    # Проверка текущих настроек
```

### 🖥️ Шаг 3: Запуск TeamServer
**В первом терминале:**
```bash
cd Server/
./teamserver 192.168.1.17 theskill19 gmail-kibers-cobalt.profile
```

**Параметры:**
- `192.168.1.17` - IP адрес сервера
- `theskill19` - пароль для подключения
- `gmail-kibers-cobalt.profile` - malleable C2 профиль

### 🖥️ Шаг 4: Запуск клиента
**Во втором терминале:**
```bash
cd Client/
./cobaltstrike-client.sh
```

### 🔌 Шаг 5: Подключение к серверу
В GUI клиента:
- **Host:** `192.168.1.17`
- **Port:** `50050` (по умолчанию)
- **User:** `akuma` (или любое имя)
- **Password:** `theskill19`

### 🎯 Шаг 6: Загрузка расширений
**Загружаем скрипты в следующем порядке:**

#### 6.1 CrossC2 Main Script
```
Script Manager → Load → ../CrossC2-GithubBot-2023-11-20.cna
```

#### 6.2 CrossC2Kit Core
```
Script Manager → Load → ../CrossC2Kit-GithubBot-2023-11-20/CrossC2Kit/CrossC2Kit.cna
```

#### 6.3 CrossC2Kit Loader
```
Script Manager → Load → ../CrossC2Kit-GithubBot-2023-11-20/CrossC2Kit/CrossC2Kit_Loader.cna
```

## 🔍 Проверка корректности загрузки

После загрузки всех скриптов проверь:

### ✅ CrossC2 Menu
- В главном меню должен появиться пункт **"CrossC2"**
- Подменю **"generator"** должно быть доступно

### ✅ CrossC2Kit Features  
- Дополнительные возможности в контекстных меню
- Расширенные beacon команды
- Кастомные функции для post-exploitation

## 🎪 Структура проекта

```
AKUMA_CobaltStrike/
├── 📁 Server/                          # TeamServer компоненты
│   ├── teamserver                      # Основной сервер
│   ├── gmail-kibers-cobalt.profile     # Malleable C2 профиль
│   ├── TeamServerImage                 # Java образ сервера
│   └── ...
├── 📁 Client/                          # GUI клиент
│   ├── cobaltstrike-client.sh          # Launcher скрипт
│   ├── cobaltstrike-client.jar         # Основной клиент
│   └── ...
├── 📁 CrossC2Kit-GithubBot-2023-11-20/ # Расширенный набор тулз
│   └── CrossC2Kit/
│       ├── CrossC2Kit.cna             # Основной компонент
│       └── CrossC2Kit_Loader.cna      # Загрузчик
├── 📁 Malleable-C2-Profiles/          # Дополнительные C2 профили
├── 📁 BOF/                            # Beacon Object Files
├── 📁 Recon-AD-master/                # AD reconnaissance tools
├── CrossC2-GithubBot-2023-11-20.cna   # Главный CrossC2 скрипт
├── genCrossC2.Linux                   # CrossC2 генератор (Linux)
├── genCrossC2.MacOS                   # CrossC2 генератор (MacOS)
├── setup_portable.sh                 # 🔧 Автоматическая настройка
├── fix_paths.sh                      # 🛠️ Быстрое исправление путей
├── check_paths.sh                    # 🔍 Диагностика настроек
└── README_PORTABLE.md                # Документация по портативности
```

## 🛡️ Безопасность и рекомендации

### 🔐 Network Security
- Используй VPN/туннель для доступа к TeamServer
- Меняй дефолтные пароли и порты
- Настрой firewall правила

### 💾 Data Protection  
- Регулярно делай backup'ы проекта
- Не оставляй логи на компрометированных системах
- Используй encrypted каналы связи

### 🎯 Operational Security
- Ротируй C2 профили для разных операций
- Используй разные infrastructure для разных target'ов
- Мониторь detection signatures твоих beacon'ов

## 🐛 Troubleshooting

### ❌ "CrossC2 menu не появилось"
1. Проверь правильность путей: `./check_paths.sh`
2. Перезапусти клиент
3. Загрузи скрипты в правильном порядке

### ❌ "genCrossC2.Linux not found"
1. Запусти: `./setup_portable.sh`
2. Убедись что файлы существуют в проекте
3. Проверь права доступа: `chmod +x genCrossC2.*`

### ❌ "TeamServer connection failed"
1. Проверь что сервер запущен и слушает
2. Убедись что firewall не блокирует порт
3. Проверь правильность IP и пароля

### ❌ "Script loading errors"
1. Проверь логи в консоли клиента
2. Убедись что все пути корректны
3. Перезагрузи скрипты в правильном порядке

## 🚀 Advanced Features

### CrossC2 Capabilities
- ✅ Cross-platform beacon generation (Linux, macOS, Windows)
- ✅ Custom communication protocols
- ✅ Advanced evasion techniques
- ✅ Steganography options

### CrossC2Kit Extensions
- ✅ Enhanced post-exploitation modules
- ✅ Automated enumeration scripts
- ✅ Custom BOF integration
- ✅ Advanced pivoting capabilities

## 📱 Quick Commands Cheat Sheet

```bash
# Проверка статуса
./check_paths.sh

# Обновление после переноса  
./setup_portable.sh

# Запуск сервера (измени IP!)
cd Server && ./teamserver YOUR_IP theskill19 gmail-kibers-cobalt.profile

# Запуск клиента
cd Client && ./cobaltstrike-client.sh
```

---

🤘 **Как говорил мой дед:** *"Хороший пентестер — это тот, кто сначала взламывает, а потом объясняет как починить!"*

**Stay sharp, stay stealthy! 😎**

---
**DISCLAIMER:** Этот инструмент предназначен исключительно для авторизованного тестирования на проникновение и образовательных целей. Используй ответственно и только с письменного разрешения владельцев систем.
