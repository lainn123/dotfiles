import os
from PIL import Image

PASTA = '/home/bocchi/Músicas/capas'
LIMIAR_SIMILARIDADE = 6  # Tolerância (0 a 64). Quanto maior, mais agressivo na remoção.

def dhash(imagem, hash_size=8):
    try:
        with Image.open(imagem) as img:
            img = img.convert('L').resize((hash_size + 1, hash_size), Image.Resampling.LANCZOS)
            pixels = list(img.getdata())
            difference = []
            for row in range(hash_size):
                for col in range(hash_size):
                    pixel_left = pixels[row * (hash_size + 1) + col]
                    pixel_right = pixels[row * (hash_size + 1) + col + 1]
                    difference.append(pixel_left > pixel_right)
            return difference
    except Exception:
        return None

def distancia_hamming(hash1, hash2):
    return sum(i1 != i2 for i1, i2 in zip(hash1, hash2))

def apagar_capas_similares():
    capas_mantidas = []
    removidos = 0

    print("Escaneando e comparando capas com margem de tolerância...")

    for raiz, _, arquivos in os.walk(PASTA):
        for arquivo in sorted(arquivos):
            caminho_completo = os.path.join(raiz, arquivo)

            if arquivo.lower().endswith(('.png', '.jpg', '.jpeg', '.webp')):
                h = dhash(caminho_completo)

                if h is None:
                    continue

                duplicada = False
                for h_salvo, caminho_salvo in capas_mantidas:
                    if distancia_hamming(h, h_salvo) <= LIMIAR_SIMILARIDADE:
                        print(f"[-] Apagando réplica: {arquivo}")
                        print(f"    (Semelhante a: {os.path.basename(caminho_salvo)})\n")
                        try:
                            os.remove(caminho_completo)
                            removidos += 1
                        except Exception as e:
                            print(f"[!] Erro ao apagar {arquivo}: {e}")
                        duplicada = True
                        break

                if not duplicada:
                    capas_mantidas.append((h, caminho_completo))

    print(f"Concluído! Total de capas parecidas/repetidas apagadas: {removidos}")

if __name__ == '__main__':
    apagar_capas_similares()
