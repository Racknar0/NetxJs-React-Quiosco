import { useEffect } from 'react'
import Image from 'next/image';
import Layout from '../layout/Layout';


export default function Home() {
    return (
        <Layout>
            <h1>Inicio</h1>
        </Layout>
    );
}



















  //* prisma client no corre desde el navegador
  // useEffect(() => {
  //   const consultardb = async () => {
  //     const prisma = new PrismaClient();
  //     const categorias = await prisma.categoria.findMany();
  //     console.log(categorias);
  //   }
  // }, []);















// export const getServerSideProps = async () => {

//     const prisma = new PrismaClient();
//     const categorias = await prisma.categoria.findMany();

//     return {
//         props: {
//             categorias,
//         },
//     };
// };
