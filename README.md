# Projeto MMX Ender 3 V3 KE

Repositório para o desenvolvimento, configuração e documentação da instalação do sistema **MMX** (Multi-Material Extension / Upgrade) na impressora 3D **Ender 3 V3 KE** (rodando firmware Klipper).

## ⚙️ Especificações Técnicas e Hardware
- **Kit Adquirido:** Trianglelab MMX - **Set B** (Com placa de controle EBB42, sem peças impressas, sem buffer de filamento FV3).
- **Eletrônica de Controle:** Placa **BigTreeTech EBB42** (CAN/USB). Será conectada via USB diretamente no host Klipper (Nebula Pad da Ender 3 V3 KE, que possui root liberado).
- **Software/Firmware:** Ecossistema **Happy Hare** para Klipper (o MMX possui suporte nativo total ao Happy Hare v2/v3).
- **Buffer de Filamento:** Como o kit não acompanha o buffer FV3, usaremos o sistema **Carrot Patch** (ou similar) que serve tanto de suporte de bobinas quanto de buffer passivo, ou fabricaremos um sistema próprio.
- **Peças Impressas:** As peças do MMX precisam ser impressas em ABS/ASA/PETG antes da montagem física na impressora.
- **Montagem Física:** A impressora é uma Creality Ender 3 V3 KE (frame de pórtico padrão, sem perfis 2020 abertos como na Voron). O suporte físico para prender o MMX no topo ou na lateral da KE precisará ser adaptado/desenhado (suporte genérico).

## 🚀 Objetivos do Projeto
- Impressão das peças estruturais do MMX.
- Montagem física e fixação do MMX no pórtico da Ender 3 V3 KE.
- Fiação elétrica da placa EBB42 com a fonte/Nebula Pad.
- Instalação e calibração do **Happy Hare** no Klipper da impressora.
- Configuração de macros de troca de ferramenta (Toolchange) e sensores.

## 👥 Colaboradores
- @Demolidor31br (Criador)
- @cursoscommatheus-oss (Colaborador)
