import simulateur
from math import pi, atan2, sqrt, sin, cos
from numpy.linalg import norm


def regulation_cap(cap, psi_til, psi_old):
    return w1, w2, 0, 0


waypoints = [(-100, -200), (-200, 200), (200, 200), (200, -200)]

def sawtooth(theta):
    return (theta + pi)%(2*pi) - pi


if __name__ == "__main__":
    sim = simulateur.Simulateur()
    puissance = 100

    t = 0
    dt = 0.1
    dt_cap = 2
    t_end = 100
    p = puissance
    theta = 0
    consigne_psi = 270*pi/180
    w1 = w2 = p
    kd = 100
    kp = 500
    psi_hat_old = psi_hat = sim.get_compas()
    _, x, y = sim.get_pos()


    x0, y0 = -200, -200
    k_wpt = 0
    x0, y0 = waypoints[k_wpt]
    psi0 = atan2(y0 - y, x0 - x)
    vect_valid_x = x0 - x
    vect_valid_y = y0 - y




    while t < t_end:
        t += dt

        sim.simulate(w1, w2, 0, 0, t)

        #reading compas
        psi_til = sim.get_compas()
        psi_hat = psi_til #valeur filtre
        _, x, y = sim.get_pos()



        #regulation
        # theta = consigne_psi - psi_til
        # w1 = p + 100*(consigne_psi - psi_til)
        # w2 = p - 100*(consigne_psi - psi_til)
        # if t > 7:
        #     p = 0
        #     print("arret")

        # # Regulation en wpt: trace du chien
        # consigne_psi = atan2(y0 - y, x0 - x)
        #
        # if sqrt((y0 - y) ** 2 + (x0 - x) ** 2) < 5:
        #     k_wpt += 1
        #     x0, y0 = waypoints[k_wpt]

        # Regulation en wpt: PID par rapport à la trace
        alpha = sawtooth(psi0 - atan2(y0 - y, x0 - x))
        err = -norm((x0-x, y0-y)) * sin(alpha) # err donne en metres
        consigne_psi = psi0 + 0.01*err

        # if t > 3:
        #     consigne_psi = pi/2
        if vect_valid_x*(x0 - x) + vect_valid_y*(y0 - y) < 0: #dépassement du waypoint (produit scalaire)
            k_wpt += 1
            if k_wpt == len(waypoints):
                p = 0
            else:

                print(20*'=')

                x0, y0 = waypoints[k_wpt]
                print(x0, y0)
                psi0 = atan2(y0 - y, x0 - x)
                print(psi0)
                vect_valid_x = x0 - x
                vect_valid_y = y0 - y







        # Regulation 2 : cap





        diff = kd * sawtooth(psi_hat - psi_hat_old)/dt + kp * sawtooth(psi_hat - consigne_psi)
        psi_hat_old = psi_hat
        print(err, consigne_psi, diff)
        w2 = p + diff
        w1 = p - diff
        # if t < 1 :
        #     diff = 1000
        # else:
        #     diff = 0
        # w2 = diff
        # w1 = - diff




    print("finnished simulation")


