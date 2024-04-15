FROM ros:humble

ENV DEBIAN_FRONTEND noninteractive

RUN ln -snf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime && \
    echo Europe/Warsaw > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    mkdir -p /root/ws/src && \
    echo 'source /opt/ros/${ROS_DISTRO}/setup.bash' >> /root/.bashrc

RUN apt-get update -q && \
    apt-get install -y --no-install-recommends \
        bash-completion \
        curl \
        iputils-ping \
        net-tools \
        tzdata \
        unzip \
        software-properties-common \
        build-essential \
        cmake \
        python3 \
        python3-pip \
        wget \
        libboost-dev \
        libboost-filesystem-dev \
        libboost-program-options-dev \
        libboost-thread-dev \
        ros-humble-joy && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
        'do_mpc[full]' \
        numpy
