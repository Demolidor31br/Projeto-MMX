// Suporte do Sensor de Filamento no Cabeçote - Ender 3 V3 KE para MMX
// Modelado parametricamente em formato de "Portal" para desviar do cabo flat
// Criado por Antigravity AI

$fn = 60;

// ==========================================
// VARIÁVEIS PARAMÉTRICAS (Altere aqui se precisar ajustar)
// ==========================================
screw_spacing = 20;     // Distância de centro a centro dos parafusos traseiros (mm)
tunnel_height = 25;     // Altura vertical livre para o cabo flat passar por dentro (mm)
reach_distance = 28;    // Avanço horizontal (Y) até a entrada de latão da extrusora (mm)
base_thickness = 4;     // Espessura da base nos furos (mm)
pilar_width = 8;        // Largura dos pilares laterais (mm)
pilar_thickness = 6;    // Espessura dos pilares laterais (mm)
arm_thickness = 6;      // Espessura do braço horizontal (mm)
ptfe_thread_d = 5.5;    // Diâmetro do furo para rosca M6 do conector pneumático (mm)
sensor_screw_d = 3.0;   // Diâmetro do furo de parafuso do sensor da KE (mm)

// ==========================================
// MÓDULOS DE CONSTRUÇÃO
// ==========================================

module base_furo(pos_x) {
    translate([pos_x, 0, 0]) {
        difference() {
            cylinder(d=pilar_width + 4, h=base_thickness);
            translate([0, 0, -1])
                cylinder(d=3.2, h=base_thickness + 2); // Furo M3 passante
        }
    }
}

module pilar(pos_x) {
    translate([pos_x - pilar_width/2, -pilar_thickness/2, 0]) {
        cube([pilar_width, pilar_thickness, tunnel_height]);
    }
}

module portal() {
    // Bases com furos
    base_furo(-screw_spacing/2);
    base_furo(screw_spacing/2);
    
    // Pilares que sobem de cada parafuso
    pilar(-screw_spacing/2);
    pilar(screw_spacing/2);
    
    // Travessa superior que une os pilares
    translate([-screw_spacing/2 - pilar_width/2, -pilar_thickness/2, tunnel_height - arm_thickness]) {
        cube([screw_spacing + pilar_width, pilar_thickness, arm_thickness]);
    }
}

module braco_e_cabeca() {
    // Braço horizontal que vai de Y=0 até reach_distance
    translate([-pilar_width/2, -pilar_thickness/2, tunnel_height - arm_thickness]) {
        cube([pilar_width, reach_distance + pilar_thickness/2, arm_thickness]);
    }
    
    // Cabeça do sensor (no final do braço)
    translate([0, reach_distance, tunnel_height - arm_thickness]) {
        difference() {
            // Bloco principal da cabeça
            translate([-8, -8, -10])
                cube([16, 16, 10 + arm_thickness]);
            
            // Furo vertical passante para o filamento (4.2mm)
            translate([0, 0, -11])
                cylinder(d=4.2, h=25);
            
            // Furo rosqueável M6 no topo para o conector pneumático PTFE
            translate([0, 0, arm_thickness - 6])
                cylinder(d=ptfe_thread_d, h=7);
        }
        
        // Aba lateral para prender o sensor original da KE
        // O sensor da KE é parafusado na lateral (eixo X)
        translate([8, -8, -25]) {
            difference() {
                // Corpo da aba
                cube([4, 16, 20]);
                
                // Dois furos de ajuste de altura para o parafuso M3 do sensor
                translate([-1, 8, 5])
                    rotate([0, 90, 0])
                        cylinder(d=sensor_screw_d, h=6);
                translate([-1, 8, 15])
                    rotate([0, 90, 0])
                        cylinder(d=sensor_screw_d, h=6);
            }
        }
        
        // Ombro/Guia traseira para travar o sensor e impedir que ele gire
        translate([4, -8, -25]) {
            cube([4, 4, 15]);
        }
    }
}

// ==========================================
// MONTAGEM FINAL
// ==========================================
union() {
    portal();
    braco_e_cabeca();
}
