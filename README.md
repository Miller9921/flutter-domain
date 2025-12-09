# Flutter Domain

Capa de dominio - Lógica de negocio pura siguiendo Clean Architecture.

## Descripción

Este paquete contiene las entidades, casos de uso e interfaces de repositorios. Es Dart puro, sin dependencias de Flutter.

## Reglas de Arquitectura

- NUNCA importar Flutter (dart:ui, material, etc.)
- NUNCA importar infraestructura
- Solo Dart puro
- Los repositorios son interfaces (abstract class)
- Las entidades contienen lógica de negocio

## Estructura

```
lib/
├── src/
│   ├── entities/
│   ├── use_cases/
│   ├── repositories/
│   └── exceptions/
└── domain.dart
```

## Uso

```dart
import 'package:domain/domain.dart';

final useCase = GetAllProductsUseCase(repository);
final products = await useCase();
```
