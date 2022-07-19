export const formatearDinero = (valor) => {
    return valor.toLocaleString('en-US', {
        style: 'currency',
        currency: 'USD',
    });
}

