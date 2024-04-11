// Generated by https://quicktype.io

export interface productos {
    id_producto?:          number;
    nombre_producto?:      string;
    descripcion_producto?: string;
    precio_producto?:      number;
    imagen_producto?:      String;
    nombre_categoria?:     number;
    nombre_plataforma?:    number;
}

export interface User {
    id_usuario: string;
    usuario:    string;
    correo:     string;
    contrasena: string;
    rol:        number;
}

export interface banners {
    nombre_banner: string;
    link_banner:   string;
    imagen_banner: string;
}
