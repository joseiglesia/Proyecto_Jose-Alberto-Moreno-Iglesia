# 🪙 Proyecto: Sui Collectibles

## Descripción
Este proyecto es un ejemplo para la **Certificación de Desarrollador Sui (WayLearn)**.  
Permite crear, transferir y administrar objetos coleccionables únicos en la blockchain Sui.

## Características principales
- Implementado en el lenguaje **Move**.
- Usa **objetos** (`struct Collectible`) con la habilidad `key`.
- Contiene **5 funciones** principales:
  1. `create_collectible` → crea un nuevo objeto.
  2. `transfer_collectible` → transfiere el objeto a otro usuario.
  3. `get_info` → obtiene información del coleccionable.
  4. `update_description` → actualiza la descripción.
  5. `delete_collectible` → elimina el objeto.

## Requisitos
- Tener configurado el entorno de desarrollo de Sui.
- Contar con tokens en Mainnet (solicítalos en el faucet oficial).
- Tener la CLI de Sui instalada y conectada a Mainnet.

## Despliegue
1. Compila el paquete:
   ```bash
   sui move build
   ```

2. Publica el módulo en la red:
   ```bash
   sui client publish --gas-budget 50000000
   ```

3. Registra el paquete en el **Move Registry**:
   [https://movepkg.dev/](https://movepkg.dev/)

## Uso básico
Ejemplo de creación:
```bash
sui client call --package <package_id>   --module collectibles   --function create_collectible   --args "Tarjeta Sui #1" "Coleccionable digital de ejemplo"   --gas-budget 20000000
```

## Autor
Jose Alberto Moreno Iglesia
