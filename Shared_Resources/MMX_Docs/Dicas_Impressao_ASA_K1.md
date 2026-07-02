# Guia de Calibração e Impressão de ASA na Creality K1

Este guia contém as melhores práticas e calibrações recomendadas para imprimir as peças do **MMX** utilizando filamento **Bambu ASA** na sua **Creality K1** (com CFS).

---

## 1. Parâmetros Adaptados para a K1 no Perfil
O perfil que geramos já leva em consideração as limitações físicas e térmicas da K1 para materiais de alta temperatura (ASA):
- **Limite de Vazão Volumétrica (Max Volumetric Speed):** Limitado em `12 mm³/s`. Embora o bico da K1 consiga derreter até `24 mm³/s` de PLA, o ASA precisa de mais tempo de residência no bloco térmico para derreter de forma homogênea. Limitar a vazão garante que o fatiador nunca force velocidades que causem entupimentos ou peças frágeis.
- **Velocidade de Impressão:** Reduzida para `120 mm/s` (paredes externas) e `150 mm/s` (paredes internas). Velocidades muito altas em ASA diminuem drasticamente a adesão entre camadas, fazendo a peça quebrar fácil. Além disso, velocidades mais baixas garantem **precisão dimensional**, crucial para encaixar os rolamentos, eixos e o servo do MMX.
- **Controle de Ventoinhas:**
  - Ventoinha da Peça (Part Cooling Fan): Mínimo `10%` / Máximo `20%` (apenas para balanços/pontes).
  - Ventoinha Auxiliar Lateral (Aux Fan): **Desligada (0%)**. O fluxo direto dessa ventoinha causaria encolhimento rápido da peça (*warping*) e descolamento da mesa.
  - Ventoinha de Exaustão Traseira: `60%` para filtrar o ar com o filtro de carvão ativado sem resfriar a câmara.

---

## 2. Calibrações Recomendadas (Antes de Iniciar as Peças do MMX)
O Creality Print (por usar a base do OrcaSlicer) possui um menu de **Calibração** no topo. Antes de imprimir as peças finais, recomendamos rodar dois testes simples para o filamento Bambu ASA:

### A. Calibração de Vazão (Flow Rate)
O fluxo padrão está em `0.95` (95%), que é excelente para o ASA. Se quiser a precisão perfeita:
1. No topo do Creality Print, vá em **Calibração** ➔ **Vazão (Flow Rate)**.
2. Siga o Passo 1 (Pass 1) e imprima o padrão.
3. Escolha o quadrado com a superfície mais lisa e ajuste o multiplicador no perfil.

### B. Calibração de Pressure Advance (PA)
O Pressure Advance evita que falte filamento no início de uma linha e que ocorra excesso (cantos arredondados) no final de movimentos rápidos. Para o ASA na K1, o valor ideal costuma ficar entre `0.035` e `0.045`.
1. Vá em **Calibração** ➔ **Pressure Advance**.
2. Selecione a opção **Linha (Line)** ou **Torre (Tower)**.
3. Após a impressão, verifique qual linha ficou mais uniforme nas transições de velocidade e configure o valor no perfil do filamento (seção de Extrusora/Pressure Advance).

---

## 3. Dicas de Ouro para Sucesso com ASA na K1
- **Pré-aquecimento da Câmara (Crucial):** O segredo para o ASA não empenar é a temperatura interna do ar (câmara). Antes de iniciar a impressão, aqueça a mesa a `100 °C` manualmente e deixe a impressora fechada por **10 a 15 minutos**. Isso vai elevar a temperatura da câmara acima de `45-50 °C`, eliminando o risco de trincas (*delamination*).
- **Adesão na Mesa:** Use a mesa de PEI lisa (Smooth PEI) limpa com Álcool Isopropílico. Aplique uma camada fina de cola bastão (ou spray fixador como 3DLac/Karina) para servir de interface de descolamento (o ASA pode grudar demais no PEI e rasgar a chapa ao esfriar, a cola serve como proteção e facilitador de remoção).
- **Suportes:** Algumas peças do MMX possuem balanços. Use suporte do tipo **Tree (Slim)** ou **Normal** com distância Z do suporte de `0.2mm` para facilitar a remoção.
