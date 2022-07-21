import Layout from '../layout/Layout';
import { useEffect, useCallback } from 'react';
import useQuiosco from '../hooks/useQuiosco';
import { formatearDinero } from '../helpers';

export default function Total() {
    const { pedido, nombre, setNombre, colocarOrden, total } = useQuiosco();

    const compobarPedido = useCallback(() => {
        return pedido.length === 0 || nombre === '' || nombre.length < 3;
    }, [pedido, nombre]);

    useEffect(() => {
        compobarPedido();
    }, [pedido, compobarPedido]);



    return (
        <Layout pagina={'Total y Confirmar pedido'}>
            <h1 className="text-4xl font-black">Total y Confirmar pedido</h1>
            <p className="text-2xl my-10">Confirma tu pedido a continuación</p>

            <form onSubmit={colocarOrden}>
                <div>
                    <label
                        htmlFor="nombre"
                        className="block upppercase text-slate-800 font-bold text-xl"
                    >
                        Nombre
                    </label>

                    <input
                        type="text"
                        id="nombre"
                        value={nombre}
                        onChange={(e) => setNombre(e.target.value)}
                        className="bg-gray-200 w-full md:w-1/3 mt-3 p-2 rounded-md"
                    />
                </div>

                <div className="mt-10">
                    <p>
                        Total a pagar {''}{' '}
                        <span className="font-bold">{formatearDinero(total)}</span>
                    </p>
                </div>

                <div className="mt-5">
                    <input
                        type="submit"
                        value={'Confirmar pedido'}
                        className={`${
                            compobarPedido()
                                ? 'bg-indigo-100'
                                : 'bg-indigo-600 hover:bg-indigo-800'
                        } w-full lg:w-auto px-5 py-2 rounded uppercase font-bold text-white text-center`}
                        disabled={compobarPedido()}
                    />
                </div>
            </form>
        </Layout>
    );
}
