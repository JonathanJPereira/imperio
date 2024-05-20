
# Documentação do Projeto Império

## Descrição
Este documento descreve a configuração e os passos necessários para executar e desenvolver o aplicativo Flutter "Império". Este é um projeto de desafio para a Loomi.

## Configuração do Ambiente

### Pré-requisitos
- Flutter SDK Versão: >=3.3.4 <4.0.0
- IDE de sua escolha com suporte para Flutter

### Instalação
1. Clone o repositório para sua máquina local:
   ```bash
   git clone https://github.com/JonathanJPereira/imperio
   ```
2. Entre no diretório do projeto:
   ```bash
   cd imperio
   ```
3. Instale todas as dependências do projeto:
   ```bash
   flutter pub get
   ```

## Geração de Códigos
Para gerar arquivos de código a partir de suas classes com anotações (como MobX stores), você deve executar o comando seguinte:
```bash
flutter pub run build_runner build
```

## Dependências
O projeto usa várias bibliotecas que são necessárias para a sua execução e desenvolvimento. Aqui estão listadas todas as dependências principais e de desenvolvimento utilizadas:

### Principais Dependências
- `mobx`: ^2.3.3
- `flutter_mobx`: ^2.2.1
- `provider`: ^6.1.2
- `flutter_svg`: ^2.0.10
- `json_annotation`: ^4.9.0
- `dio`: ^5.4.3
- `get_it`: ^7.7.0
- `intl`: ^0.19.0
- `flutter_hooks`: ^0.20.5
- `timeago`: ^3.6.1
- `fluttertoast`: ^8.2.5
- `flutter_secure_storage`: ^9.2.1
- `flutter_masked_text2`: ^0.9.1
- `flutter_dotenv`: ^5.1.0

### Dependências de Desenvolvimento
- `flutter_launcher_icons`: ^0.13.1
- `mobx_codegen`: ^2.6.1
- `build_runner`: ^2.4.9
- `json_serializable`: ^6.8.0

### Prints do APP:

![Login](imperio_prints/1.jpg)

